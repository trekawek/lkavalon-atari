#!/usr/bin/env python3
"""Run Atari800 on a private Xvfb display and execute a JSON test scenario.

Requires Atari800, Xvfb and Python's Xlib package. This drives the real 6502
emulator and its monitor; it does not replace the Atari OS or Forth runtime.
Example:
  python3 tools/emulate.py build/ad2044-side1.atr --scenario tools/emulate-smoke.json
  python3 tools/emulate.py build/figforth.atr --scenario /tmp/scenario.json

A scenario is a JSON list of steps, for example:
  [{"wait": 5}, {"key": "space"}, {"wait": 2},
   {"monitor": "WRITE 0000 FFFF /tmp/memory.bin"}, {"screenshot": true}]
Monitor commands leave emulation paused until a {"continue": true} step.
Keys accept X11 names (Return, space, F4) or chords (Shift_L+F5).
Use {"text": "1 LOAD\n"} to type an ASCII command at the Forth prompt.
"""

import argparse
import json
import os
from pathlib import Path
import pty
import select
import shutil
import subprocess
import tempfile
import time


class Atari:
    def __init__(self, args, output):
        from Xlib import display
        self.args = args
        self.output = output
        self.transcript = bytearray()
        self.paused = False
        self.xvfb = None
        self.proc = None
        self.master = None
        self.display = None
        self.image_count = 0
        self.temp = tempfile.TemporaryDirectory(prefix="ad2044-atari-")
        display_name = args.display
        if not display_name:
            for number in range(83, 200):
                if not Path(f"/tmp/.X11-unix/X{number}").exists():
                    display_name = f":{number}"
                    break
            else:
                raise RuntimeError("No unused X11 display number found")
            self.xvfb = subprocess.Popen(
                ["Xvfb", display_name, "-screen", "0", "800x600x24", "-nolisten", "tcp"],
                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE,
            )
        deadline = time.monotonic() + 10
        while time.monotonic() < deadline:
            try:
                self.display = display.Display(display_name)
                break
            except Exception:
                if self.xvfb and self.xvfb.poll() is not None:
                    raise RuntimeError(self.xvfb.stderr.read().decode(errors="replace"))
                time.sleep(.1)
        if self.display is None:
            raise RuntimeError(f"Cannot connect to X display {display_name}")
        self.master, slave = pty.openpty()
        self.screenshot_file = Path(self.temp.name) / "screen.png"
        config_file = Path(self.temp.name) / "atari800.cfg"
        # Explicit flags isolate this run from the user's emulator preferences.
        config_file.write_text("Atari 800 Emulator, Version 5.2.0\n")
        command = [
            args.emulator, "-config", str(config_file), "-no-autosave-config",
            "-xl", "-xl-rev", "altirra", "-nobasic", "-pal", "-nosound",
            "-nojoystick", "-kbdjoy0", "-no-kbdjoy1", "-windowed",
            "-no-video-accel", "-screenshots", str(self.screenshot_file),
        ]
        if args.turbo:
            command.append("-turbo")
        if args.state:
            command.extend(["-state", str(Path(args.state).resolve())])
        if args.run:
            command.extend(["-run", str(Path(args.run).resolve())])
        command.extend(str(Path(disk).resolve()) for disk in args.disks)
        self.proc = subprocess.Popen(
            command, stdin=slave, stdout=slave, stderr=slave,
            env={**os.environ, "DISPLAY": display_name},
        )
        os.close(slave)

    def read(self, seconds=.1):
        until = time.monotonic() + seconds
        result = bytearray()
        while time.monotonic() < until:
            readable, _, _ = select.select([self.master], [], [], min(.05, max(0, until - time.monotonic())))
            if readable:
                try:
                    data = os.read(self.master, 65536)
                except OSError:
                    break
                if not data:
                    break
                self.transcript.extend(data)
                result.extend(data)
        return result.decode(errors="replace")

    def wait(self, seconds):
        self.read(seconds)
        if self.proc.poll() is not None:
            raise RuntimeError(f"Atari800 exited ({self.proc.returncode}):\n{self.transcript.decode(errors='replace')}")

    def key(self, name, hold=.06):
        from Xlib import X, XK
        from Xlib.ext import xtest
        codes = []
        for part in name.split("+"):
            keysym = XK.string_to_keysym(part)
            if not keysym and len(part) == 1:
                keysym = ord(part)
            if not keysym:
                raise ValueError(f"Unknown X11 key name: {part}")
            code = self.display.keysym_to_keycode(keysym)
            if not code:
                raise ValueError(f"X11 key is not mapped: {part}")
            codes.append(code)
        for code in codes:
            xtest.fake_input(self.display, X.KeyPress, code)
        self.display.sync()
        self.read(hold)
        for code in reversed(codes):
            xtest.fake_input(self.display, X.KeyRelease, code)
        self.display.sync()
        self.read(.08)

    def text(self, text):
        from Xlib import XK
        text.encode("ascii")
        for char in text:
            if char in "\r\n":
                self.key("Return")
            elif char == " ":
                self.key("space")
            else:
                keysym = ord(char)
                code = self.display.keysym_to_keycode(keysym)
                name = XK.keysym_to_string(keysym)
                # Explicit names avoid the chord separator for the '+' key.
                if char == "+":
                    name = "plus"
                if self.display.keycode_to_keysym(code, 0) != keysym:
                    name = "Shift_L+" + name
                self.key(name)

    def monitor(self, command):
        if not self.paused:
            self.key("F8")
            self.wait_prompt()
            self.paused = True
        os.write(self.master, command.encode("ascii") + b"\n")
        return self.wait_prompt()

    def wait_prompt(self):
        result = ""
        until = time.monotonic() + 10
        while time.monotonic() < until:
            result += self.read(.05)
            # key() may already have collected the initial monitor prompt.
            if self.transcript.endswith(b"> "):
                return result
            if self.proc.poll() is not None:
                break
        raise RuntimeError(f"Atari monitor did not reach a prompt:\n{result}")

    def resume(self):
        if self.paused:
            os.write(self.master, b"CONT\n")
            self.paused = False
            self.wait(.1)

    def screenshot(self, name=None):
        self.resume()
        self.screenshot_file.unlink(missing_ok=True)
        self.key("F10")
        until = time.monotonic() + 3
        while time.monotonic() < until and not self.screenshot_file.exists():
            self.wait(.05)
        if not self.screenshot_file.exists():
            raise RuntimeError("Atari800 did not produce a screenshot")
        self.image_count += 1
        destination = self.output / (name or f"screen-{self.image_count:02}.png")
        shutil.copyfile(self.screenshot_file, destination)
        print(f"Screenshot: {destination}", flush=True)

    def step(self, step):
        if "wait" in step:
            self.wait(float(step["wait"]))
        elif "key" in step:
            self.resume()
            self.key(step["key"], float(step.get("hold", .06)))
        elif "text" in step:
            self.resume()
            self.text(step["text"])
        elif "monitor" in step:
            result = self.monitor(step["monitor"])
            print(result, end="", flush=True)
        elif "continue" in step:
            self.resume()
        elif "screenshot" in step:
            name = step["screenshot"]
            self.screenshot(None if name is True else name)
        else:
            raise ValueError(f"Unknown scenario step: {step}")

    def close(self):
        if self.proc and self.proc.poll() is None:
            if not self.paused:
                self.key("F8")
                self.wait_prompt()
                self.paused = True
            os.write(self.master, b"QUIT\n")
            try:
                self.proc.wait(timeout=3)
            except subprocess.TimeoutExpired:
                self.proc.kill()
                self.proc.wait()
        if self.master is not None:
            self.read(.1)
            os.close(self.master)
        (self.output / "emulator.log").write_bytes(self.transcript)
        if self.display:
            self.display.close()
        if self.xvfb:
            self.xvfb.terminate()
            self.xvfb.wait(timeout=3)
        self.temp.cleanup()


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("disks", nargs="*")
    parser.add_argument("--emulator", default="atari800")
    parser.add_argument("--output", default="/tmp/ad2044-runtime")
    parser.add_argument("--scenario", help="JSON list of wait/key/text/monitor/continue/screenshot steps")
    parser.add_argument("--display", help="Reuse an existing display instead of starting Xvfb")
    parser.add_argument("--state", help="Initial Atari800 savestate")
    parser.add_argument("--run", help="Atari XEX program to run")
    parser.add_argument("--turbo", action="store_true")
    parser.add_argument("--seconds", type=float, default=8)
    args = parser.parse_args()
    output = Path(args.output).resolve()
    output.mkdir(parents=True, exist_ok=True)
    scenario = json.loads(Path(args.scenario).read_text()) if args.scenario else [
        {"wait": args.seconds}, {"screenshot": "boot.png"},
        {"monitor": f"WRITE 0000 FFFF {output / 'memory.bin'}"},
        {"monitor": f"SAVESTATE {output / 'state.a8s'}"},
    ]
    machine = Atari(args, output)
    try:
        for step in scenario:
            machine.step(step)
    finally:
        machine.close()


if __name__ == "__main__":
    main()

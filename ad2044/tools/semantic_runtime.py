"""Execute bounded original game words using the shared APX fig-Forth ABI.

The caller supplies the released game's memory image. This runs the actual
6502 code, including threaded dispatch; it does not translate Forth words or
provide Atari OS services, interrupts, or device emulation.
"""

from py65.devices.mpu6502 import MPU


class OriginalForth:
    def __init__(self, memory):
        self.memory = bytearray(memory)
        self.cpu = MPU(memory=self.memory)
        # Cold-start normally installs the indirect JMP used by NEXT at $CC.
        self.memory[0xCC] = 0x6C
        self.put(0xCF, 0xBC00)
        self.put(0x0604, 0x0606)  # Sentinel CFA -> stop address.

    def put(self, address, value):
        self.memory[address:address + 2] = (value & 0xFFFF).to_bytes(2, 'little')

    def get(self, address):
        return int.from_bytes(self.memory[address:address + 2], 'little')

    def call(self, cfa, *arguments):
        self.cpu.x = 0x80
        self.cpu.sp = 0xFF
        for value in arguments:
            self.cpu.x -= 2
            self.put(self.cpu.x, value)
        self.put(0x0600, cfa)
        self.put(0x0602, 0x0604)
        self.put(0xCA, 0x0600)  # Thread pointer; NEXT fetches the first CFA.
        self.cpu.pc = 0x0F47
        for _ in range(100_000):
            self.cpu.step()
            if self.cpu.pc == 0x0606:
                if self.cpu.sp != 0xFF or not 0x20 <= self.cpu.x <= 0x80:
                    raise AssertionError('Unbalanced original Forth stacks')
                return [self.get(a) for a in range(0x7E, self.cpu.x - 1, -2)]
        raise AssertionError(f'Word ${cfa:04X} did not return: PC=${self.cpu.pc:04X}')

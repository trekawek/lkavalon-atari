#!/usr/bin/env python3
"""Verification rejects changed code while permitting freshly allocated resources."""

import hashlib
import unittest

import verify


def image():
    result = bytearray(verify.ATR_SIZE)
    result[:6] = bytes.fromhex("960280208000")
    return result


class VerificationTests(unittest.TestCase):
    def setUp(self):
        self.template = image()
        self.compiled = image()
        self.program = bytes((i * 17 + i // 13) & 255 for i in range(verify.PROGRAM_BYTES))
        self.compiled[16:verify.PROGRAM_END] = self.program
        self.digest = hashlib.sha256(self.program).hexdigest()
        self.side2 = image()

    def test_program_digest_includes_boot_and_continuation_copies(self):
        self.assertEqual(verify.verify_program(self.compiled, self.digest), self.digest)
        for offset in (16, 0x7F0F, 0x7F10, 0x84B6):
            with self.subTest(offset=offset):
                edited = bytearray(self.compiled)
                edited[offset] ^= 1
                with self.assertRaisesRegex(ValueError, "executable changed"):
                    verify.verify_program(edited, self.digest)

    def test_new_resource_sectors_and_padding_do_not_change_program_check(self):
        for offset in (verify.PROGRAM_END, 0xF990, len(self.compiled) - 1):
            self.compiled[offset] = self.template[offset] = 0xA5
        self.side2[-300:-290] = b"new assets"
        self.assertEqual(verify.verify_program(self.compiled, self.digest), self.digest)
        verify.verify_resources(self.compiled, self.side2, self.template, self.side2)

    def test_template_code_and_stale_resources_are_rejected(self):
        dirty = bytearray(self.template)
        dirty[16] = 1
        with self.assertRaisesRegex(ValueError, "contains executable"):
            verify.verify_resources(self.compiled, self.side2, dirty, self.side2)
        stale = bytearray(self.compiled)
        stale[verify.PROGRAM_END + 7] = 1
        with self.assertRaisesRegex(ValueError, "side one"):
            verify.verify_resources(stale, self.side2, self.template, self.side2)
        stale2 = bytearray(self.side2)
        stale2[-1] = 1
        with self.assertRaisesRegex(ValueError, "side two"):
            verify.verify_resources(self.compiled, stale2, self.template, self.side2)

    def test_geometry_and_write_protection_are_validated(self):
        for bad in (self.compiled[:-1], self.compiled + b"x", bytes(verify.ATR_SIZE)):
            with self.assertRaisesRegex(ValueError, "ATR"):
                verify.verify_program(bad, self.digest)
        self.compiled[15] = self.template[15] = 1
        with self.assertRaisesRegex(ValueError, "writable"):
            verify.verify_resources(self.compiled, self.side2, self.template, self.side2)


if __name__ == "__main__":
    unittest.main()

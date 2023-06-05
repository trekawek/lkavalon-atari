package main

import (
	"bytes"
	"io/ioutil"
	"os"
)

const BEGIN = "Written by:D.Zolna"
const END = "D.Zolna is De Jet"

func main() {
	buffer, _ := ioutil.ReadAll(os.Stdin)
	from := bytes.Index(buffer, internal([]byte(BEGIN))) + len(BEGIN)
	to := bytes.Index(buffer, internal([]byte(END)))
	for i := from; i < to; i++ {
		buffer[i] ^= 17
	}
	os.Stdout.Write(buffer)
}

func internal(buffer []byte) []byte {
	var result = make([]byte, len(buffer))
	for i, b := range buffer {
		c := b
		if b < 32 {
			c += 64
		} else if b >= 32 && b < 95 {
			c -= 32
		} else if b >= 96 && b < 127 {
			c = b
		}
		result[i] = c
	}
	return result
}

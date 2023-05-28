package main

import (
	"bufio"
	"bytes"
	"encoding/binary"
	"encoding/hex"
	"fmt"
	"io"
	"log"
	"os"
	"strings"
)

type file struct {
	address uint16
	levels  []level
}

type level struct {
	lvl []byte
}

const headerLen = 6
const levelWidth = 16
const levelHeight = 32
const levelSize = levelWidth * levelHeight

const levelToken = "### level ###"
const addressToken = "addr: "
const metadataToken = "metadata: "

var ATASCII_TO_ASCII = map[byte]rune{
	0x00: '♥',
	0x01: '├',
	0x04: '┤',
	0x05: '┐',
	0x06: '╱',
	0x0A: '◣',
	0x0D: '▔',
	0x0E: '▂',
	0x0F: '▖',
	0x11: '┌',
	0x12: '─',
	0x13: '┼',
	0x14: '•',
	0x17: '┬',
	0x18: '┴',
	0x1C: '↑',
	0x1D: '↓',
	0x1E: '←',
	0x1F: '→',
	0xA0: '█',
}

func main() {
	if len(os.Args) != 2 {
		usage()
		return
	}
	if os.Args[1] == "encode" {
		encode()
	} else if os.Args[1] == "decode" {
		decode()
	} else {
		usage()
	}

}

func usage() {
	log.Fatal("Please use 'decode' or 'encode' argument and provide data in stdin")
}

func encode() {
	var lines []string
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		lines = append(lines, strings.TrimRight(scanner.Text(), "\n"))
	}

	f := file{}
	for i := 0; i < len(lines); i++ {
		line := lines[i]
		if len(line) == 0 {
			continue
		}
		if strings.HasPrefix(line, addressToken) {
			decoded, _ := hex.DecodeString(lines[i][len(addressToken):])
			f.address = binary.BigEndian.Uint16(decoded)
		}
		if line == levelToken {
			i++
			f.levels = append(f.levels, parseTextLevel(lines[i:(i+levelHeight)]))
			i += levelHeight
		}
	}

	os.Stdout.Write(f.toBytes())
}

func parseTextLevel(lines []string) level {
	buff := bytes.Buffer{}
	for i := 0; i < levelHeight-1; i++ {
		line := lines[i]
		for _, b := range []rune(line) {
			buff.WriteByte(translateToAtascii(b))
		}
	}
	metadata := lines[levelHeight-1][len(metadataToken):]
	metadataBytes, _ := hex.DecodeString(metadata)
	buff.Write(metadataBytes)
	return level{lvl: buff.Bytes()}
}

func (f *file) toBytes() []byte {
	startAddress := make([]byte, 2)
	endAddress := make([]byte, 2)
	binary.LittleEndian.PutUint16(startAddress, f.address)
	binary.LittleEndian.PutUint16(endAddress, f.address+uint16(len(f.levels)*levelSize)-1)

	buff := bytes.Buffer{}
	buff.WriteByte(0xFF)
	buff.WriteByte(0xFF)
	buff.Write(startAddress)
	buff.Write(endAddress)
	for _, l := range f.levels {
		for _, b := range l.lvl {
			buff.WriteByte(b)
		}
	}
	return buff.Bytes()
}

func decode() {
	data, err := io.ReadAll(os.Stdin)
	if err != nil {
		log.Fatalf("can't read stdin: %v", err)
	}
	startAddress := binary.LittleEndian.Uint16(data[2:4])
	endAddress := binary.LittleEndian.Uint16(data[4:6])
	levelCount := int((1 + endAddress - startAddress) / levelSize)

	f := file{}
	f.address = startAddress
	for i := 0; i < levelCount; i++ {
		f.levels = append(f.levels, level{lvl: data[headerLen+i*levelSize : headerLen+(i+1)*levelSize]})
	}

	fmt.Println(f.toString())
}

func (f *file) toString() string {
	var sb strings.Builder
	sb.WriteString(fmt.Sprintf("%s%X\n", addressToken, f.address))
	for _, l := range f.levels {
		sb.WriteString(levelToken)
		sb.WriteRune('\n')
		sb.WriteString(l.toString())
		sb.WriteRune('\n')
	}
	return sb.String()
}

func (l *level) toString() string {
	var sb strings.Builder
	for j := 0; j < levelHeight-1; j++ {
		for i := 0; i < levelWidth; i++ {
			b := l.lvl[i+levelWidth*j]
			sb.WriteRune(translateToAscii(b))
		}
		sb.WriteByte('\n')
	}
	sb.WriteString(metadataToken)
	sb.WriteString(hex.EncodeToString(l.lvl[levelSize-levelWidth:]))
	sb.WriteByte('\n')
	return sb.String()
}

func translateToAtascii(b rune) byte {
	for atascii, ascii := range ATASCII_TO_ASCII {
		if b == ascii {
			return atascii
		}
	}
	return byte(b)
}

func translateToAscii(b byte) rune {
	translated, ok := ATASCII_TO_ASCII[b]
	if ok {
		return translated
	} else {
		return rune(b)
	}
}

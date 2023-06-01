package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"os"
	"regexp"
	"strings"
)

var dtaRegex = regexp.MustCompile("(?i)\\bDTA ")
var emptyBlock = regexp.MustCompile("(?i),?[CD]''\\*?")
var immediateArg = regexp.MustCompile("(?)#'(.)'")

var ATASCII_TO_ASCII = map[byte]rune{
	0x00: '♥',
	0x01: '├',
	0x03: '┘',
	0x04: '┤',
	0x05: '┐',
	0x06: '╱',
	0x07: '╲',
	0x08: '◢',
	0x09: '▗',
	0x0A: '◣',
	0x0B: '▝',
	0x0C: '▘',
	0x0D: '▔',
	0x0E: '▂',
	0x0F: '▖',
	0x11: '┌',
	0x12: '─',
	0x13: '┼',
	0x14: '•',
	0x17: '┬',
	0x18: '┴',
	0x1A: '└',
	0x1C: '↑',
	0x1D: '↓',
	0x1E: '←',
	0x1F: '→',
	0xA0: '█',
}

func main() {
	buffer, _ := ioutil.ReadAll(os.Stdin)
	for _, line := range bytes.Split(buffer, []byte{155}) {
		result := escapeDta(string(line))
		result = escapeChar(result)
		result = escapeOtherAtascii(result)
		fmt.Println(result)
	}
}

type state int

const (
	idle state = iota
	stringModifier
	numberModifier
	stringData
	numberData
	finishedSegment
)

func escapeDta(in string) string {
	ind := dtaRegex.FindStringIndex(in)
	if ind == nil {
		return in
	}

	result := strings.Builder{}
	result.WriteString(in[0:ind[1]])

	s := idle
	modifier := ""
	var data []byte

	for i := ind[1]; i < len(in); i++ {
		c := string(in[i])
		next := ""
		if i < len(in)-1 {
			next = string(in[i+1])
		}
		switch s {
		case idle:
			cl := strings.ToLower(c)
			if cl == "c" || cl == "d" {
				s = stringModifier
				modifier = c
			} else {
				if cl == "a" || cl == "b" || cl == "l" || cl == "h" {
					s = numberModifier
				}
				result.WriteString(c)
			}

		case stringModifier:
			if c == "'" {
				s = stringData
			} else {
				result.WriteString(c)
			}
		case stringData:
			if c == "'" && next == "'" {
				data = append(data, '\'', '\'')
				i += 1
			} else if c == "'" && next != "'" {
				result.WriteString(escapeTextDta(data, modifier, next == "*"))
				data = nil
				modifier = ""
				s = finishedSegment
			} else {
				data = append(data, in[i])
			}

		case numberModifier:
			if c == "(" {
				s = numberData
			}
			result.WriteString(c)

		case numberData:
			if c == ")" {
				s = finishedSegment
			}
			result.WriteString(c)

		case finishedSegment:
			if c == "," {
				s = idle
			}
			result.WriteString(c)
		}
	}
	return result.String()
}

func escapeTextDta(content []byte, modifier string, inversed bool) string {
	inversedModifier := ""
	if inversed {
		inversedModifier = "*"
	}
	internal := strings.ToLower(modifier) == "d"

	result := strings.Builder{}

	openedQuote := false
	empty := true

	for _, b := range content {
		if b >= 32 && b < 127 {
			if !openedQuote {
				if !empty {
					result.WriteString(",")
				}
				result.WriteString(modifier)
				result.WriteString("'")
				openedQuote = true
			}
			result.WriteByte(b)
		} else {
			if openedQuote {
				result.WriteString("'")
				result.WriteString(inversedModifier)
				openedQuote = false
			}
			if !empty {
				result.WriteString(",")
			}
			b = translateCharacter(b, inversed, internal)
			result.WriteString(fmt.Sprintf("B($%02X)", int(b)))
		}
		empty = false
	}
	if openedQuote {
		result.WriteString("'")
		result.WriteString(inversedModifier)
	}

	return result.String()
}

func translateCharacter(b byte, inversed bool, internal bool) byte {
	var result byte
	if internal {
		if b >= 128 {
			result = atasciiToInternal(b-128) + 128
		} else {
			result = atasciiToInternal(b)
		}
	} else {
		result = b
	}

	if inversed {
		result += 128
	}
	return result
}

func atasciiToInternal(b byte) byte {
	result := b
	if b < 32 {
		result += 64
	} else if b >= 32 && b < 95 {
		result -= 32
	} else if b >= 96 && b < 127 {
		// do nothing
	}
	return result
}

func escapeChar(in string) string {
	groups := immediateArg.FindStringSubmatch(in)
	if groups == nil {
		return in
	}
	char := groups[1][0]
	if char < 32 || char >= 127 {
		return immediateArg.ReplaceAllString(in, fmt.Sprintf("#$$%02X", char))
	} else {
		return in
	}
}

func escapeOtherAtascii(in string) string {
	result := strings.Builder{}
	for _, b := range []byte(in) {
		translated, ok := ATASCII_TO_ASCII[b]
		if ok {
			result.WriteRune(translated)
		} else {
			result.WriteByte(b)
		}
	}
	return result.String()
}

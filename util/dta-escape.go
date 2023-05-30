package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strings"
)

var dtaRegex = regexp.MustCompile("(?i)\\bDTA ")
var block = regexp.MustCompile("(?i)([CD])'([^']+)'(\\*?)")
var emptyBlock = regexp.MustCompile("(?i),?[CD]''\\*?")

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		line := scanner.Text()
		fmt.Println(escapeLine(line))
	}
}

func escapeLine(in string) string {
	if !dtaRegex.MatchString(in) {
		return in
	}
	return block.ReplaceAllStringFunc(in, func(s string) string {
		groups := block.FindStringSubmatch(s)
		t := groups[1]
		content := groups[2]
		inversed := groups[3]

		escapedContent := escapeDtaContent(content, t, inversed)

		result := fmt.Sprintf("%s'%s'%s", t, escapedContent, inversed)
		result = emptyBlock.ReplaceAllString(result, "")
		return result
	})
}

func escapeDtaContent(in string, t string, inversedModifier string) string {
	inversed := inversedModifier == "*"
	internal := strings.ToLower(t) == "d"

	result := strings.Builder{}
	for _, b := range []byte(in) {
		if b >= 32 {
			result.WriteByte(b)
		} else {
			b = translateCharacter(b, inversed, internal)
			result.WriteString(fmt.Sprintf("'%s,B($%02X),%s'", inversedModifier, int(b), t))
		}
	}
	return result.String()
}

func translateCharacter(b byte, inversed bool, internal bool) byte {
	result := b
	if internal {
		result += 64
	}
	if inversed {
		result += 128
	}
	return result
}

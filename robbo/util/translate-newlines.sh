#!/bin/bash -e

function translate {
  local tmp;
  tmp="$(mktemp)"
  tr '\233\177' '\12\11' < "$1" > "$tmp"
  mv "$tmp" "$1"
}

for file in "$@"; do
  translate "$file"
done

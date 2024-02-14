#!/bin/bash
#
#
#
cd ./scripts/go
# go build -o ../../bin/.local/bin

for file in *.go; do
	# Get the base name of the file without the .go extension
	base=$(basename "$file" .go)
	# Build the program with the base name as the output binary
	go build -o "../../bin/.local/bin/$base" "$file"
done

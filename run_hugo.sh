#!/bin/bash
export PATH="$PWD/go/bin:$PATH"
echo "Go version:"
go version
echo "Hugo version:"
./hugo version
echo "Running hugo:"
./hugo

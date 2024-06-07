#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Shell-Functions.html

x=hello

function f1 {
  echo "f1: x=$x"
  x='Hello from f1'
}

function f2 {
  local x
  echo "f2: x=$x"
  x='Hello from f2'

  f1
}

f1
echo "x=$x"
f2
echo "x=$x"


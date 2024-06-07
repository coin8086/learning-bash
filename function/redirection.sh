#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Shell-Functions.html

function f {
  echo "hello"
  echo "function"
} > 'function.out'

f

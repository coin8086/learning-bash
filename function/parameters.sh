#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html
# https://www.gnu.org/software/bash/manual/html_node/Positional-Parameters.html
# https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html

function f {
  echo "Paramters($#):"
  echo "$@"
  echo "$1"
  echo "$2"
  echo "$3"
}

f a b c

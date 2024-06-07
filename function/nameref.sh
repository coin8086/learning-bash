#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html

declare -i x=100

function f1 {
  local -n ref=$1
  ref+=1
  echo "f1: ref=$ref"

  # NOTE: Here the name $1 is passed to f2.
  # Also note that the variable of name $1, is visible to f2.
  f2 $1
}

function f2 {
  local -n ref=$1
  ref+=1
  echo "f2: ref=$ref"
}

f1 x
echo "x=$x"

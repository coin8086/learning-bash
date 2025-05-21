#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html

declare -i x=100

function f1 {
  local -n ref=$1
  ref+=1
  echo "f1: ref=$ref"

  local y="hello"

  # NOTE: Here the name $1 is passed to f2.
  # Also note that the variable of name $1, is visible to f2.
  f2 $1 ref y z

  echo "f1: z=$z"
}

function f2 {
  local -n ref=$1
  ref+=1
  echo "f2: ref=$ref"

  local -n ref2=$2
  ref2+=1
  echo "f2: ref2=$ref2"

  local -n ref3=$3
  echo "f2: ref3=$ref3"

  local -n ref4=$4
  echo "f2: ref4=$ref4"

  ref4="hi"
}

f1 x
echo "x=$x"
echo "y=$y"
echo "z=$z"

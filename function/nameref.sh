#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html

declare -i x=100
declare -a a=('a' 'b' 'c')

function f {
  local -n ref_x=$1
  local -n ref_a=$2
  echo "f before: ref_x=$ref_x ref_a=${a[@]}"
  ref_x+=10
  ref_a+=('d' 'e')
  echo "f after: ref_x=$ref_x ref_a=${a[@]}"
}

f x a
echo "x=$x ref_a=${a[@]}"

#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html

declare -i x=100

function f {
  local -n ref_x=$1
  echo "f before: ref_x=$ref_x"
  ref_x+=10
  echo "f after: ref_x=$ref_x"
}

f x
echo "x=$x"

#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Shell-Functions.html
# https://www.gnu.org/software/bash/manual/html_node/Compound-Commands.html
# https://www.gnu.org/software/bash/manual/html_node/Command-Grouping.html

function f1 {
  abc=1
  echo "f1: abc=$abc"
}

# NOTE: the function "body" is defined in a subshell, so the variables defined inside
# the function are not visible outside.
function f2 (
  abc=10
  echo "f2: abc=$abc"
)

f1
echo "abc=$abc"
f2
echo "abc=$abc"

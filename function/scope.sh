#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Shell-Functions.html

x=hello

function f1 {
  echo "f1: x=$x"
  x='Hello from f1'
}

# "The shell uses dynamic scoping to control a variable’s visibility within functions.
# With dynamic scoping, visible variables and their values are a result of the sequence
# of function calls that caused execution to reach the current function. The value of a
# variable that a function sees depends on its value within its caller, if any, whether
# that caller is the "global" scope or another shell function. This is also the value
# that a local variable declaration "shadows", and the value that is restored when the
# function returns."
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


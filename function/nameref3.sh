#!/bin/bash

set -ex

function f1 {
  # NOTE:
  # It is an error to have
  # local -ni var=$1
  # where "-i" is used together with "-n".
  local -ni var=$1
  echo "f1 before: var=$var"
  (( var += 1 ))
  echo "f1 after: var=$var"
}

declare -i v=10
f1 v
echo "global: v=$v"

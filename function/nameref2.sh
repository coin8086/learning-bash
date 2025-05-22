#!/bin/bash

set -e

function f1 {
  local -n ref=$1
  local ref_name=$1
  echo "f1 before: $ref"
  ref+="f1"
  # NOTE:
  # There would be a warning of "circular name reference" if it was
  # f2 ref
  f2 $ref_name
  echo "f1 after: $ref"
}

function f2 {
  local -n ref=$1
  echo "f2 before: $ref"
  ref+="f2"
  echo "f2 after: $ref"
}


var="xyz"
f1 var
echo "global: $var"

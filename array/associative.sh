#!/bin/bash

# See https://www.gnu.org/software/bash/manual/html_node/Arrays.html

function show_array {
  local -n array=$1
  echo "array $1 of length ${#array[@]}:"
  for key in "${!array[@]}"; do
    local value=${array[$key]}
    echo "key=$key value=$value"
  done
}

echo '---- Define an associative array ----'

# Define an associative array
declare -A a2=([x]=1 [y]=2 [z]=3)
show_array a2

echo '---- Define an associative array in another way ----'

# Or
declare -A a3=(x 1 y 2 z 3)
show_array a3

echo '---- Get keys and values of associative array ----'

echo "keys of a2=${!a2[@]}"
echo "values of a2=${a2[@]}"

echo '---- Access array elements ----'

# Reference array element
echo ${a2[x]}
echo ${a2[y]}
echo ${a2[z]}

# Set array element
a2[x]=ok
a2[hello]='Hi, yo!'

show_array a2

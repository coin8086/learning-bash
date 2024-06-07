#!/bin/bash

# See https://www.gnu.org/software/bash/manual/html_node/Arrays.html

echo '---- Define an indexed array ----'

# Define an array
declare -a a=(x y zz)

# Expand the array into separate words
echo "a=${a[@]}"

echo '---- Get length of array ----'

# Get array and array element length
echo "#a=${#a[@]}"
echo "#a[2]=${#a[2]}"

echo '---- Enumerate an indexed array ----'

# Enumerate an array
for e in "${a[@]}"; do
  echo $e
done

echo '---- Access array elements ----'

# Reference array element
echo ${a[0]}
echo ${a[1]}
echo ${a[2]}

# Set array element
a[0]=1
a[10]=10
echo "a=${a[@]}"
echo "#a=${#a[@]}"

echo '---- Append to array ----'

# Append to array
a+=(1 2)
echo "a=${a[@]}"

echo '---- Assign array variable ----'

# Assign an array variable to another array variable
# NOTE: The following line doesn't work!
# declare -a b=$a

# do it like this
declare -a b=${a[@]}
echo "b=${b[@]}"

# Or use nameref
declare -n c=a
echo "c=${c[@]}"

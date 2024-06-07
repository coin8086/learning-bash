#!/bin/bash

# See
# https://www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Builtins.html#index-getopts
# https://www.man7.org/linux/man-pages/man1/getopts.1p.html

set -e

function show_help {
  echo "$0 [-h] [-s] [-a {arg}]"
}

echo '---- getopts ----'

while getopts 'hsa:' opt; do
  case $opt in
    s ) switch=1 ;;
    a ) arg=$OPTARG ;;
    h ) show_help && exit ;;
    ? ) show_help && exit 1 ;;
  esac
done

echo "switch=$switch, arg=$arg, OPTIND=$OPTIND"
echo "\$@=$@"

echo '---- getopts in function ----'

function parse_cmdline {
  local OPTIND
  local OPTARG
  local opt

  while getopts 'hsa:' opt; do
    case $opt in
      s ) local switch=1 ;;
      a ) local arg=$OPTARG ;;
      h ) show_help && exit ;;
      ? ) show_help && exit 1 ;;
    esac
  done

  echo "switch=$switch, arg=$arg, OPTIND=$OPTIND"
  echo "\$@=$@"
}

parse_cmdline "$@"

echo '---- getopts in function 2 ----'

function parse_cmdline2 {
  local -n cmdline_ref=$1 # array of args from cmd line
  local OPTIND
  local OPTARG
  local opt

  while getopts 'hsa:' opt ${cmdline_ref[@]}; do
    case $opt in
      s ) local switch=1 ;;
      a ) local arg=$OPTARG ;;
      h ) show_help && exit ;;
      ? ) show_help && exit 1 ;;
    esac
  done

  echo "switch=$switch, arg=$arg, OPTIND=$OPTIND"
  echo "\$@=$@"
}

declare -a cmd=("$@")
parse_cmdline2 cmd

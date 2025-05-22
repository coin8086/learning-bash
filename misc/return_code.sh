#!/bin/bash

false

if (( $? == 0 )); then
  echo "Success: $?"
else
  echo "Failure: $?"
fi

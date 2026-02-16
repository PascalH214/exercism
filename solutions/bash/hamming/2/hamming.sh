#!/usr/bin/env bash

main () {
  local first_strand="$1"
  local second_strand="$2"
  local first_length="${#first_strand}"

  if [ "$#" -ne 2 ]; then
    echo "Usage: hamming.sh <string1> <string2>"
    exit 1
  fi

  if [[ "${first_length}" -ne "${#second_strand}" ]]; then 
    echo "strands must be of equal length"
    exit 1
  fi

  hamming_distance=0
  for (( i=0;i<first_length;i++ )); do
    if [ "${first_strand:$i:1}" != "${second_strand:$i:1}" ]; then
      (( hamming_distance++ ))
    fi
  done

  echo "${hamming_distance}"
}

main "$@"

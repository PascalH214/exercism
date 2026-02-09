#!/usr/bin/env bash

main () {
  number_to_test="$1"

  length=${#number_to_test}
  sum=0
  for (( i=0; i<${length}; i++ )); do
    c="${number_to_test:$i:1}"
    (( sum += c ** length ))
  done

  if [[ $number_to_test == $sum ]]; then 
    echo "true"
  else echo "false"
  fi
}

main "$@"
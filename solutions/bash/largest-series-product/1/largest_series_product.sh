#!/usr/bin/env bash

calculate_product () {
  local series="$1"

  product="1"
  for (( i=0;i<${#series};i++ )); do
    (( product *= "${series:i:1}" ))
  done
  
  echo "${product}"
}

main () {
  local input="$1"
  local input_length="${#input}"
  local span="$2"

  if (( span < 0 )); then
    echo "span must not be negative"
    exit 1
  fi

  if (( input_length < span )); then
    echo "span must not exceed string length"
    exit 1
  fi

  if [[ ! $input =~ ^[0-9]+$ ]]; then
    echo "input must only contain digits"
    exit 1
  fi

  series=""
  product=0
  for (( i=0;i<=input_length-span;i++ )); do
    window="${input:i:span}"
    this_product=$(calculate_product "${window}")

    if (( product < this_product )); then
      series="${window}"
      product=${this_product}
    fi
  done

  echo "${product}"
}

main "$@"

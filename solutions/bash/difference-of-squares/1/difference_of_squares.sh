#!/usr/bin/env bash

square_of_sum() {
  local number="$1"

  sum=0
  for (( number; number > 0; number-- )); do
    (( sum += number ))
  done

  echo "$(( sum ** 2 ))"
}

sum_of_squares() {
  local number="$1"

  sum=0
  for (( number; number >= 0; number-- )); do
    (( sum += number ** 2 ))
  done

  echo "${sum}"
}

difference() {
  local square_of_sum_res="$(square_of_sum $number)"
  local sum_of_squares_res="$(sum_of_squares $number)"

  echo "$(( square_of_sum_res - sum_of_squares_res ))"
}

main () {
  operation="$1"
  number="$2"

  [[ "$operation" == "square_of_sum" ]] && square_of_sum $number
  [[ "$operation" == "sum_of_squares" ]] && sum_of_squares $number
  [[ "$operation" == "difference" ]] && difference $number

  return 0
}

main "$@"
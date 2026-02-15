#!/usr/bin/env bash

calc_grains_on_field () {
  local field="$1"

  if ! [[ "$field" =~ ^[0-9]+$ ]] || (( field < 1 || field > 64 )); then
    return 1
  fi

  bc <<< "2^(${field} - 1)"
}

calc_total () {
  grains=0
  for (( i=1;i<=64;i++ )); do
    grains="$( bc <<< $(calc_grains_on_field "$i")+$grains )"
  done
  echo "${grains}"
}

main () {
  local field="$1"
  local result

  if [[ $field == "total" ]]; then
    echo "$(calc_total)"
  elif ! result="$(calc_grains_on_field "$field")"; then
    echo "Error: invalid input"
    exit 1
  fi

  echo "${result}"
}

main "$@"

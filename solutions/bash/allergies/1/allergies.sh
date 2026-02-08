#!/usr/bin/env bash

# - eggs (1)
# - peanuts (2)
# - shellfish (4)
# - strawberries (8)
# - tomatoes (16)
# - chocolate (32)
# - pollen (64)
# - cats (128)

allergies=("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")

main() {
  local score=$1
  local query=$2
  local allergy=$3
  local mask=$(( score % 2 ** ${#allergies[@]} ))

  have_allergies=""
  for (( i=0; i<${#allergies[@]}; i++ )); do
    if [[ "$query" == "list" ]]; then
      if (( mask & (1 << i) )); then
        have_allergies+="${allergies[i]} "
      fi
    elif [[ ${allergies[i]} == "$allergy" ]]; then
      if (( mask & (1 << i) )); then
        echo true
      else
        echo false
      fi
      return
    fi
  done

  if [[ "$query" == "allergic_to" ]]; then
    echo false
  else
    echo "${have_allergies% }"
  fi
}

main "$@"
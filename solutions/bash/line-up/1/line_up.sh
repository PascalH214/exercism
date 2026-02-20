#!/usr/bin/env bash

main () {
  local name="$1"
  local number="$2"

  local modified_number="${number}th"
  local last_digit="${#number}"
  (( last_digit -= 1 ))

  if (( number % 100 < 11 || 13 < number % 100 )); then
    case "${number:${last_digit}:1}" in
      "1")
        modified_number="${number}st"
        ;;
      "2")
        modified_number="${number}nd"
        ;;
      "3")
        modified_number="${number}rd"
        ;;
      *)
        modified_number="${number}th"
        ;;
    esac
  fi

  echo "${name}, you are the ${modified_number} customer we serve today. Thank you!"
}

main "$@"

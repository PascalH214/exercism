#!/usr/bin/env bash

main() {
  argc="$#"

  if (( "1" != "${argc}" )); then
    echo "Usage: error_handling.sh <person>"
    exit 1
  fi

  echo "Hello, $1"
}

main "$@"

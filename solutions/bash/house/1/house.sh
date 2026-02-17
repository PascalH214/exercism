#!/usr/bin/env bash

verses=(
  "This is the horse and the hound and the horn"
  "This is the farmer sowing his corn"
  "This is the rooster that crowed in the morn"
  "This is the priest all shaven and shorn"
  "This is the man all tattered and torn"
  "This is the maiden all forlorn"
  "This is the cow with the crumpled horn"
  "This is the dog"
  "This is the cat"
  "This is the rat"
  "This is the malt"
  "This is the house that Jack built"
)

lines=(
  "that belonged to the farmer sowing his corn"
  "that kept the rooster that crowed in the morn"
  "that woke the priest all shaven and shorn"
  "that married the man all tattered and torn"
  "that kissed the maiden all forlorn"
  "that milked the cow with the crumpled horn"
  "that tossed the dog"
  "that worried the cat"
  "that killed the rat"
  "that ate the malt"
  "that lay in the house that Jack built"
)

count_of_verses="${#verses[@]}"
count_of_lines="${#lines[@]}"

main () {
  local first="$1"
  local second="$2"

  if [ "$#" -ne "2" ] || (( first < 1 || first > 12 || second < 1 || second > 12 )); then
    echo "invalid"
    exit 1
  fi

  local difference
  local from
  local to
  (( difference = second - first ))
  (( from = count_of_verses - first ))
  (( to = from - difference ))

  for (( i=from;i>=to;i-- )); do
    to_print="${verses[$i]}"
    for (( j=i;j<count_of_lines;j++ )); do
      to_print="${to_print}\n${lines[$j]}"
    done
    echo -e "${to_print}."
    if (( i != to )); then
      echo ""
    fi
  done
}

main "$@"

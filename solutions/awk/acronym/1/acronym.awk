BEGIN {
  FS = "[ -]"
}

{
  for (i=1;i<=NF;i++) acr = acr substr(gensub("_", "", "g", $i), 0, 1)
}

END {
  print toupper(acr)
}

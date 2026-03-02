function get_power(score) {
  power=0

  while (2 ^ (power + 1) <= score) {
    power++
  }

  return power;
}

function get_allergen_of_power(power) {
  switch (power) {
    case 0:
      return "eggs"
      break
    case 1:
      return "peanuts"
      break
    case 2:
      return "shellfish"
      break
    case 3:
      return "strawberries"
      break
    case 4:
      return "tomatoes"
      break
    case 5:
      return "chocolate"
      break
    case 6:
      return "pollen"
      break
    case 7:
      return "cats"
      break
  }
}

function is_allergic_to(score, allergen) {
  while (score > 0) {
    power = get_power(score)
    score -= 2 ^ power
    if (get_allergen_of_power(power) == allergen) {
      return "true"
    }
  }
  return "false"
}

function get_list(score) {
  list = ""
  while (score > 0) {
    power = get_power(score)
    score -= 2 ^ power
    if (power > 7) continue
    list = get_allergen_of_power(power)","list
  }
  return substr(list, 1, length(list)-1)
}

BEGIN {
  FS = ","
}

{
  score=$1
  fun=$2
  allergen=$3

  if (fun == "allergic_to") print is_allergic_to(score, allergen)
  else if (fun == "list") print get_list(score)
}

END {
}

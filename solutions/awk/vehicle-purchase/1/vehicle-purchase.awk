BEGIN {
    FS = ","    # comma is the field separator
}

$1 == "needs_license" && tolower($2) ~ /(car|truck)/ { print "true" }
$1 == "resell_price" {
  if ($3 < 3) {
    print $2 * 0.8
  } else if (3 <= $3 && $3 <= 10) {
    print $2 * 0.7
  } else {
    print $2 * 0.5
  }
}

# Task 1: When the first field is "needs_license",
#         print "true" if the second field contains "car" or "truck".

# Task 2: When the first field is "resell_price",
#         print the resell value of the original price (second field)
#         given the age of the car (third field).

object Bob {
  fun hey(input: String): String {
    val text = input.trim()

    if (text.isEmpty()) {
      return "Fine. Be that way!"
    }

    val hasLetters = text.any { it.isLetter() }
    val isYelling = hasLetters && text == text.uppercase()

    return when {
      isYelling && text.endsWith("?") -> "Calm down, I know what I'm doing!"
      text.endsWith("?") -> "Sure."
      isYelling -> "Whoa, chill out!"
      else -> "Whatever."
    }
  }
}
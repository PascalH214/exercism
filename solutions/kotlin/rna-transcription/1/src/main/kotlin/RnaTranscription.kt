import javax.naming.directory.InvalidAttributesException

fun transcribeToRna(dna: String): String =
    dna.uppercase().map {
        when (it) {
            'G' -> 'C'
            'C' -> 'G'
            'T' -> 'A'
            'A' -> 'U'
            else -> throw InvalidAttributesException("")
        }
    }.joinToString("")
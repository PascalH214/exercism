fun translate(rna: String?): List<String> {
    if (rna.isNullOrEmpty())
        return emptyList();

    val proteins = mutableListOf<String>();
    var counter = 0;
    var gotStopped = false;
    loop@ for (i in 0 until rna.length / 3) {
        val codon = rna.substring(i * 3, i * 3 + 3);
        counter++;
        proteins.add(
            when (codon) {
                "AUG" -> "Methionine"
                "UUU", "UUC" -> "Phenylalanine"
                "UUA", "UUG" -> "Leucine"
                "UCU", "UCC", "UCA", "UCG" -> "Serine"
                "UAU", "UAC" -> "Tyrosine"
                "UGU", "UGC" -> "Cysteine"
                "UGG" -> "Tryptophan"
                "UAA", "UAG", "UGA" -> {
                    gotStopped = true;
                    break@loop
                }
                else -> throw IllegalArgumentException("Invalid codon")
            }
        )
    }

    if (!gotStopped && rna.length - counter * 3 != 0)
        throw IllegalArgumentException("Invalid codon")

    return proteins;
}

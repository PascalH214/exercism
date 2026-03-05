class Dna(val seq: String) {
    init {
        if (!Regex("[ACGT]+|").matches(seq))
            throw IllegalArgumentException("Invalid sequence");
    }

    val nucleotideCounts: Map<Char, Int>
        get() {
            val map = mutableMapOf(
                'A' to 0,
                'C' to 0,
                'G' to 0,
                'T' to 0
            );
            for (c in seq) {
                map[c] = map.getOrDefault(c, 0) + 1;
            }
            return map;
        }
}

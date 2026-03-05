object Isogram {

    fun isIsogram(input: String): Boolean {
        var alreadyOccurred = arrayOf<Char>();

        for (c in input.replace(" ", "").replace("-", "").lowercase()) {
            if (alreadyOccurred.contains(c))
                return false;
            alreadyOccurred += c;
        }

        return true;
    }
}

object ETL {
    fun transform(source: Map<Int, Collection<Char>>): Map<Char, Int> {
        val result = mutableMapOf<Char, Int>();

        for (key in source.keys) {
            val values = source[key];
            if (values.isNullOrEmpty()) continue
            for (value in values) {
                result[value.lowercaseChar()] = key;
            }
        }

        return result;
    }
}

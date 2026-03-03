object CollatzCalculator {
    fun computeStepCount(start: Int): Int {
        if (start < 1) throw IllegalArgumentException("Number must be one or larger!");
        var current = start;
        var steps = 0;
        while (current > 1) {
            if (current % 2 == 0) current /= 2;
            else current = current * 3 + 1;
            steps++;
        }
        return steps;
    }
}

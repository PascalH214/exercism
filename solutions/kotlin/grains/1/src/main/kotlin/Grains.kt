import java.math.BigInteger

object Board {

    fun getGrainCountForSquare(number: Int): BigInteger {
        if (number !in 1..64)
            throw IllegalArgumentException("Number must be in range of 1 and 64 (inclusive)");
        return BigInteger.TWO.pow(number-1);
    }

    fun getTotalGrainCount(): BigInteger {
        var totalCount = BigInteger.ZERO;

        for (i in 0..64-1) {
            totalCount += BigInteger.TWO.pow(i);
        }

        return totalCount;
    }
}

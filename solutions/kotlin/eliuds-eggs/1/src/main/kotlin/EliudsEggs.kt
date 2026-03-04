import kotlin.math.pow

object EliudsEggs {

    fun eggCount(number: Int): Int{
        var current = number;
        var count = 0;

        while (current > 0) {
            val remainder = current.mod(2);
            count += remainder;
            current /= 2;
        }

        return count;
    }
}

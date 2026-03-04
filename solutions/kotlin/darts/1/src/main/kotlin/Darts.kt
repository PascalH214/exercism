import kotlin.math.hypot

object Darts {
    private const val innerRing = 1.0
    private const val middleRing = 5.0
    private const val outerRing = 10.0

    fun score(x: Number, y: Number): Int {
        val toss = hypot(x.toDouble(), y.toDouble())
        fun throwWithin(ring: Double) = toss <= ring

        if (throwWithin(innerRing)) return 10
        if (throwWithin(middleRing)) return 5
        if (throwWithin(outerRing)) return 1
        return 0
    }
}

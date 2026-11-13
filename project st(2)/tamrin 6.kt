fun main() {
    val name: String = "Ali"
    // name = null  // خطا: String معمولی نمی‌تواند null باشد.

    var nickname: String? = null
    nickname = "Al"

    println("نام: $name")
    println("نام مستعار: ${nickname ?: "ندارد"}")
}

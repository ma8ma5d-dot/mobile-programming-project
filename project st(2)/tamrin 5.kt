class Book(
    val title: String,
    val author: String
)

fun main() {
    val book = Book("آموزش Kotlin", "علی رضایی")

    println("عنوان کتاب: ${book.title}")
    println("نویسنده: ${book.author}")
}

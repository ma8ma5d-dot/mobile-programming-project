class Book {
  String title;
  String author;

  Book(this.title, this.author);
}

void main() {
  Book book = Book('Learning Dart', 'Ali Ahmadi');

  print('عنوان کتاب: ${book.title}');
  print('نام نویسنده: ${book.author}');
}

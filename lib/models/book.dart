class Book {
  final int? id;
  final String title;
  final String author;
  final int year;
  final String imgUrl;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.year,
    required this.imgUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      year: json['year'],
      imgUrl: json['imgUrl'],
    );
  }
}

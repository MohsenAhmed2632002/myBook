class BookEntity {
  final String bookId;
  final String name;
  final String imagePath;
  final String writer;
  final num rating;
  final double? cash;
  BookEntity({required this.bookId, 
    required this.cash,
    required this.name,
    required this.imagePath,
    required this.writer,
    required this.rating,
  });
}

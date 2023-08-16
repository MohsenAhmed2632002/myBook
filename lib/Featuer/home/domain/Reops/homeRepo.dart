class BookRepo {
  final String name;
  final String imagePath;
  final String writer;
  final double rating;
  final double cash;
  BookRepo({
    required this.cash,
    required this.name,
    required this.imagePath,
    required this.writer,
    required this.rating,
  });
}
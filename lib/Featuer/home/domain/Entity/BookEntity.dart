


import 'package:hive/hive.dart';
part 'BookEntity.g.dart';
@HiveType(typeId: 0)

class BookEntity {
  @HiveField(0)
  final String bookId;@HiveField(1)
  final String name;@HiveField(2)
  final String imagePath;@HiveField(3)
  final String writer;@HiveField(4)
  final num rating;@HiveField(5)
  final double? cash;
  BookEntity({required this.bookId, 
    required this.cash,
    required this.name,
    required this.imagePath,
    required this.writer,
    required this.rating,
  });
}

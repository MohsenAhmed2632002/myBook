import 'package:mybook/Featuer/home/data/Model/book_model/book_model.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Services.dart';

abstract class HomeLocalDataSourcess {
  List<BookEntity> fechFeatuerBooks();
  List<BookEntity> fechNewestBooks();
}
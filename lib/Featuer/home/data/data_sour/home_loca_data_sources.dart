import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';

abstract class HomeLocalDataSourcess {
  List<BookEntity> fechFeatuerBooks();
  List<BookEntity> fechNewestBooks();
}
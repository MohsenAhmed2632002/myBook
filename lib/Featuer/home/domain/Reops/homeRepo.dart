import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> fechFeatuerBooks();
  Future<List<BookEntity>> fechNewestBooks();
}

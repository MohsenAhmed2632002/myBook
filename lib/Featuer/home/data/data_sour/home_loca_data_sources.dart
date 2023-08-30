import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';

abstract class HomeLocalDataSourcess {
  List<BookEntity> fechFeatuerBooks();
  List<BookEntity> fechNewestBooks();
}
class HomeLocalDataSourcessImpl extends HomeLocalDataSourcess {
  @override
  List<BookEntity> fechFeatuerBooks() {
    // TODO: implement fechFeatuerBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fechNewestBooks() {
    // TODO: implement fechNewestBooks
    throw UnimplementedError();
  }
  
}
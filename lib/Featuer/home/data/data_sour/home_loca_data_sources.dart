import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSourcess {
  List<BookEntity> fechFeatuerBooks();
  List<BookEntity> fechNewestBooks();
}

class HomeLocalDataSourcessImpl extends HomeLocalDataSourcess {
  @override
  List<BookEntity> fechFeatuerBooks() {
    var box = Hive.box<BookEntity>("FeatueredBox");
    return box.values.toList();
  }

  @override
  List<BookEntity> fechNewestBooks() {
    var box = Hive.box<BookEntity>("NewestBox");
    return box.values.toList();
  }
}

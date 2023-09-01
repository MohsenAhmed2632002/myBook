import 'package:mybook/Featuer/home/data/Model/book_model/book_model.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Services.dart';
import "package:hive/hive.dart";

abstract class HomeRemoteDataSourcess {
  Future<List<BookEntity>> fechFeatuerBooks();
  Future<List<BookEntity>> fechNewestBooks();
}

class HomeRemoteDataSourcessImpl extends HomeRemoteDataSourcess {
  // https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=computerscience
  final ApiServices apiServices;
  final String url = "https://www.googleapis.com/books/v1";
  final String _endPoint = "volumes?Filtering=free-ebooks&q=computerscience";

  HomeRemoteDataSourcessImpl(this.apiServices);
  @override
  Future<List<BookEntity>> fechFeatuerBooks() async {
    var data = await apiServices.get(endPoint: _endPoint);
    // http.Response _response = await ApiServices.get(url: url, endPoint: _endPoint);
    //       Map<String, dynamic> data = jsonDecode(_response.body);

    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel?.fromJson(bookMap));
    }
    var box = Hive.box<BookEntity>("FeatueredBox");
    box.addAll(books);
    return books;
  }

  @override
  Future<List<BookEntity>> fechNewestBooks() async {
    final String _endPoint =
        "volumes?Filtering=free-ebooks&Sorting=newest&q=programming";

    var data = await apiServices.get(endPoint: _endPoint);

    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel?.fromJson(bookMap));
    }
    var box = Hive.box<BookEntity>("NewestBox");
    box.addAll(books);
    return books;
  }
}

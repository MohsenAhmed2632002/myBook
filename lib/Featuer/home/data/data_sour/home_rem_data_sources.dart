// import 'package:mybook/Featuer/home/data/Model/book_model/book_model.dart';
// import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
// import 'package:mybook/Services.dart';

// abstract class HomeRemoteDataSourcess {
//   Future<List<BookEntity>> fechFeatuerBooks();
//   Future<List<BookEntity>> fechNewestBooks();
// }

// class HomeRemoteDataSourcessImpl extends HomeRemoteDataSourcess {
//   late Api api;
//   final String url = "https://www.googleapis.com/books/v1";
//   final String _endPoint = "volumes?Filtering=free-ebooks&q=programming";
//   @override
//   Future<List<BookEntity>> fechFeatuerBooks() async {
//     var data = await api.get(url: url, endPoint: _endPoint);
//     List<BookEntity> books = [];
//     for (var bookMap in data["items"]) {
//       books.add(BookModel.fromJson(bookMap));
//     }
//     return books;
//   }

//   @override
//   Future<List<BookEntity>> fechNewestBooks()async {
//       final String _endPoint = "volumes?Filtering=free-ebooks&Sorting=newest&q=programming";

//      var data = await api.get(url: url, endPoint: _endPoint);
//     List<BookEntity> books = [];
//     for (var bookMap in data["items"]) {
//       books.add(BookModel.fromJson(bookMap));
//     }
//     return books;
//   }
// }

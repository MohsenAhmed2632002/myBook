import 'package:mybook/Featuer/home/data/data_sour/home_loca_data_sources.dart';
import 'package:mybook/Featuer/home/data/data_sour/home_rem_data_sources.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Featuer/home/domain/Reops/homeRepo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSourcessImpl homeRemoteDataSourcessImpl;
  final HomeLocalDataSourcess homeLocalDataSourcess;

  HomeRepoImpl(
      {required this.homeLocalDataSourcess,
      required this.homeRemoteDataSourcessImpl});
  @override
  Future<List<BookEntity>> fechFeatuerBooks() async {
    try {
      var booksList = homeLocalDataSourcess.fechFeatuerBooks();
      if (booksList.isNotEmpty) {
        return booksList;
      }
      var books = await homeRemoteDataSourcessImpl.fechFeatuerBooks();
      return books;
    } on Exception catch (e) {
      print("Exception $e");

      throw e;
    }
  }

  @override
  Future<List<BookEntity>> fechNewestBooks() async {
    try {
      var booksList = homeLocalDataSourcess.fechNewestBooks();
      if (booksList.isNotEmpty) {
        return booksList;
      }
      dynamic books = await homeRemoteDataSourcessImpl.fechNewestBooks();
      return books;
    } on Exception catch (e) {
      print("Exception $e");

      throw e;
    }
  }
}

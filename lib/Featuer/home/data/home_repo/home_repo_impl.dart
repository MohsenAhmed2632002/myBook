import 'package:mybook/Featuer/home/data/data_sour/home_rem_data_sources.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Featuer/home/domain/Reops/homeRepo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSourcessImpl homeRemoteDataSourcessImpl;
  HomeRepoImpl({required this.homeRemoteDataSourcessImpl});
  @override
  Future<List<BookEntity>> fechFeatuerBooks() async {
    try {
      List<BookEntity> theFeatuerBooksList =
          await homeRemoteDataSourcessImpl.fechFeatuerBooks();
      return theFeatuerBooksList;
    } on Exception catch (e) {
      print("Exception $e");

      throw e;
    }
  }

  @override
  Future<List<BookEntity>> fechNewestBooks() async {
    try {
      List<BookEntity> theNewestBooksList =
          await homeRemoteDataSourcessImpl.fechNewestBooks();
      return theNewestBooksList;
    } on Exception catch (e) {
      print("Exception $e");
      throw e;
    }
  }
}

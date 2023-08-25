import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Featuer/home/domain/Reops/homeRepo.dart';

class FarchNewestBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FarchNewestBooksUseCase(this.homeRepo);
  Future<List<BookEntity>> call([void param]) async {
    return await homeRepo.fechNewestBooks();
  }
}

abstract class UseCase<T, Param> {
  Future<T> call([Param param]);
}

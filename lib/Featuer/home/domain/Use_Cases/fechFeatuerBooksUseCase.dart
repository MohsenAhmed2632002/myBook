import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Featuer/home/domain/Reops/homeRepo.dart';

class FechFeatuerBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FechFeatuerBooksUseCase(this.homeRepo);
  Future<List<BookEntity>> call([void param]) async {
    return await homeRepo.fechFeatuerBooks();
  }
}

abstract class UseCase<T, Param> {
  Future<T> call([Param param]);
}

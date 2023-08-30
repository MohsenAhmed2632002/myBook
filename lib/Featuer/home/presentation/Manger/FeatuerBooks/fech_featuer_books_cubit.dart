import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Featuer/home/domain/Use_Cases/fechFeatuerBooksUseCase.dart';

part 'fech_featuer_books_state.dart';

class FechFeatuerBooksCubit extends Cubit<FechFeatuerBooksState> {
  FechFeatuerBooksCubit(this.fechFeatuerBooksUseCase)
      : super(FechFeatuerBooksInitial());
  final FechFeatuerBooksUseCase fechFeatuerBooksUseCase;
  Future fechFeatuerBook() async {
    emit(FechFeatuerBooksLoading());
    emit(FechFeatuerBooksSuccess(
      await fechFeatuerBooksUseCase.call(),
    ));
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Featuer/home/domain/Use_Cases/fechNewestBooksUseCase.dart';

part 'newest_books_state.dart';

class FechNewestBooksCubit extends Cubit<FechNewestBooksState> {
  FechNewestBooksCubit( this.fechNewsetBooksUseCase) : super(FechNewestBooksInitial());
  final FechNewestBooksUseCase fechNewsetBooksUseCase;
  Future fechNewestBook() async {
    emit(FechNewestBooksLoading());
    emit(FechNewestBooksSuccess(await fechNewsetBooksUseCase.call()));
  }
}

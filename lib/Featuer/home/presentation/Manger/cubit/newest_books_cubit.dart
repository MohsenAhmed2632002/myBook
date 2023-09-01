import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';
import 'package:mybook/Featuer/home/domain/Use_Cases/fechNewestBooksUseCase.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit( this.fechNewsetBooksUseCase) : super(NewestBooksInitial());
  final FechNewestBooksUseCase fechNewsetBooksUseCase;
  Future fechNewestBook() async {
    emit(FechNewestBooksLoading());
    emit(FechNewestBooksSuccess(await fechNewsetBooksUseCase.call()));
  }
}

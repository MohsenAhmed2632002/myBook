part of 'fech_featuer_books_cubit.dart';

@immutable
sealed class FechFeatuerBooksState {}

final class FechFeatuerBooksInitial extends FechFeatuerBooksState {}

final class FechFeatuerBooksSuccess extends FechFeatuerBooksState {
  final List<BookEntity> myBook;
  FechFeatuerBooksSuccess(this.myBook);
}

final class FechFeatuerBooksLoading extends FechFeatuerBooksState {}

final class FechFeatuerBooksFaulier extends FechFeatuerBooksState {
  final String EM;
  FechFeatuerBooksFaulier(this.EM);
}

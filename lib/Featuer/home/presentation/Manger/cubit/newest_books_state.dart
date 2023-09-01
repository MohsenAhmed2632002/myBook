part of 'newest_books_cubit.dart';

@immutable
sealed class FechNewestBooksState {}

final class FechNewestBooksInitial extends FechNewestBooksState {}
final class FechFeatuerBooksInitial extends FechNewestBooksState {}

final class FechNewestBooksSuccess extends FechNewestBooksState {
  final List<BookEntity> myNewestBook;
  FechNewestBooksSuccess(this.myNewestBook);
}

final class FechNewestBooksLoading extends FechNewestBooksState {}

final class FechNewestBooksFaulier extends FechNewestBooksState {
  final String EM;
  FechNewestBooksFaulier(this.EM);
}

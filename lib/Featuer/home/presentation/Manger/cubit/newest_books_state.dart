part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}
final class FechFeatuerBooksInitial extends NewestBooksState {}

final class FechNewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> myNewestBook;
  FechNewestBooksSuccess(this.myNewestBook);
}

final class FechNewestBooksLoading extends NewestBooksState {}

final class FechNewestBooksFaulier extends NewestBooksState {
  final String EM;
  FechNewestBooksFaulier(this.EM);
}

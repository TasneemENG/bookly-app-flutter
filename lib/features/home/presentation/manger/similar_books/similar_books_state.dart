import '../../../data/models/books/books.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksFailure(this.errMessage);
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<Books> books;

  SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilarBooksState {}
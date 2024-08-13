
import '../../../data/models/books/books.dart';

abstract class NewstBooksState {}

final class NewstBooksInitial extends NewstBooksState {}
final class NewstBooksLoading extends NewstBooksState {}
final class NewstBooksSuccess extends NewstBooksState {
  List<Books> books;
  NewstBooksSuccess(this.books);
}
final class NewstBooksFaliures extends NewstBooksState {
  final String error;
  NewstBooksFaliures(this.error);
}

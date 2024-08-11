import 'package:bookly_app/features/home/data/models/books/books.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
abstract class HomeRepo{
  Future<Either<Failure, List<Books>>> fetchNewsetBooks();
  Future<Either<Failure, List<Books>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Books>>> fetchSimilarBooks(
      {required String category});
}

import 'package:bookly_app/features/home/data/models/books/books.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_service.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Books>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      List<Books> books = [];
      for (var item in data['items']) {
        try {
          books.add(Books.fromJson(item));
        } catch (e) {
          books.add(Books.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Books>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<Books> books = [];
      for (var item in data['items']) {
        books.add(Books.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Books>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
      List<Books> books = [];
      for (var item in data['items']) {
        books.add(Books.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
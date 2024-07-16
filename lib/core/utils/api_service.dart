import 'package:dio/dio.dart';
import 'package:bookly_app/features/home/data/models/books/books.dart';
class ApiService {
  final Dio dio;
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes?';

  ApiService({required this.dio});

  Future<List<Books>> getBooks(endpoints) async {
    try {
      final response = await dio.get("$baseUrl$endpoints");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> items = responseData['items'] ?? [];

        List<Books> bookList = items.map((json) => Books.fromJson(json)).toList();
        return bookList;
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      throw Exception('Failed to load books: $e');
    }
  }
}

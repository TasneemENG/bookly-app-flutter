import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/books/books.dart';

import 'BestSellerBookCard.dart';
class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key});

  @override
  _BestSellerListViewState createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  late ApiService apiService;
  List<Books>? books;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    apiService = ApiService(dio: Dio());
    fetchBestSellers();
  }

  Future<void> fetchBestSellers() async {
    try {
      List<Books> fetchedBooks = await apiService.getBooks('Filtering=free-ebooks&sorting=relevance&q=programming');
      setState(() {
        books = fetchedBooks;
        isLoading = false;
        errorMessage = '';
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load best sellers: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (errorMessage.isNotEmpty) {
      return SliverToBoxAdapter(
        child: Center(child: Text(errorMessage)),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final book = books![index];
            return BestSellerBookCard(book: book); // Use BestSellerBookCard widget to display each book
          },
          childCount: books!.length,
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:bookly_app/features/home/data/models/books/books.dart';

import 'BookDetailScreen.dart'; // Adjust import based on your project structure

class SimilarBooksListView extends StatelessWidget {
  final List<Books> similarBooks;

  const SimilarBooksListView({super.key, required this.similarBooks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: similarBooks.length,
      itemBuilder: (context, index) {
        final book = similarBooks[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  book: book,
                  similarBooks: similarBooks.where((b) => b != book).toList(), // Pass similar books excluding the current book
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(book.volumeInfo?.imageLinks?.thumbnail ?? ''),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

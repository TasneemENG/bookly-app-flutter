import 'package:flutter/material.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/books/books.dart';

import 'SimilarBooksListView.dart'; // Adjust import based on your project structure

class DetailsScreen extends StatelessWidget {
  final Books book;
  final List<Books>? similarBooks;

  const DetailsScreen({super.key, required this.book, this.similarBooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff100B20),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Implement shopping cart functionality
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 162,
                height: 243,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(book.volumeInfo?.imageLinks?.thumbnail ?? ''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Center(
                    child: Text(
                      book.volumeInfo?.title ?? 'No Title',
                      style: Styles.textStyle20.copyWith(
                          fontSize: 21, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.volumeInfo?.authors?.join(', ') ?? 'No Authors',
                    style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 19),
                      const SizedBox(width: 4),
                      Text(
                        '4.5', // Replace with dynamic data as needed
                        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '(100)', // Replace with dynamic data as needed
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                          color: Colors.white,
                        ),
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        child: const Text(
                          '19.99€',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                          color: Color(0xFFEF8262),
                        ),
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        child: const Text(
                          'Free preview',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Similar books section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'You may also like',
                        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200, // Adjust the height as needed
                    child: similarBooks != null && similarBooks!.isNotEmpty
                        ? SimilarBooksListView(similarBooks: similarBooks!)
                        : const Center(child: Text('No similar books available', style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

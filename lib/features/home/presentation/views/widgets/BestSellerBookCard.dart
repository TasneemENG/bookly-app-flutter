import 'package:flutter/material.dart';
import 'package:bookly_app/features/home/data/models/books/books.dart';

import '../../../../../core/utils/styles.dart';

class BestSellerBookCard extends StatelessWidget {
  final Books book;

  const BestSellerBookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 105,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(book.volumeInfo?.imageLinks?.thumbnail ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    book.volumeInfo?.title ?? 'No Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    book.volumeInfo?.authors?.first ?? 'Unknown Author',
                    style: Styles.textStyle14,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w700)
                      ),
                      const SizedBox(width: 100),
                      Row(
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
                    ],
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

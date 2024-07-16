import 'package:bookly_app/features/splash/presentation/views/widgets/BookDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/features/home/data/models/books/books.dart';

class Firstlistview extends StatefulWidget {
  const Firstlistview({Key? key, required this.books}) : super(key: key);

  final List<Books>? books;

  @override
  _FirstlistviewState createState() => _FirstlistviewState();
}

class _FirstlistviewState extends State<Firstlistview> {
  int? _selectedBookIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.books == null || widget.books!.isEmpty) {
      return const Center(child: Text('No books available'));
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.books!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final book = widget.books![index];
            final imageUrl = book.volumeInfo?.imageLinks?.thumbnail ?? '';
            final similarBooks = widget.books!.where((b) => b != book).toList(); // Find similar books

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      book: book,
                      similarBooks: similarBooks, // Pass similar books
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                width: _selectedBookIndex == index ? 220 : 150,
                height: _selectedBookIndex == index ? 350 : 300,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    if (_selectedBookIndex == index)
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                  ],
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (_selectedBookIndex == index)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: Center(
                            child: Text(
                              book.volumeInfo?.title ?? 'No Title',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

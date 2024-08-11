import 'package:bookly_app/features/home/presentation/views/widgets/BestSellerListView.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/FirstListView.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/books/books.dart';
import 'package:bookly_app/core/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late ApiService apiService;
  List<Books>? books;
  bool isLoading = true;
  String errorMessage = '';
  late AnimationController _animationController;
  late Animation<double> _animation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    apiService = ApiService(dio: Dio());
    fetchBooks();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

  Future<void> fetchBooks() async {
    try {
      List<Books> fetchedBooks =
      await apiService.getBooks('orderBy=newest&q=computer%20science');
      setState(() {
        books = fetchedBooks;
        isLoading = false;
        errorMessage = '';
      });

      // Automatically scroll to a predefined position
      if (!isLoading && books!.isNotEmpty) {
        _scrollToPosition();
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load books: $e';
        isLoading = false;
      });
    }
  }

  void _scrollToPosition() {
    // Replace 500 with the desired scroll offset or calculate dynamically
    _scrollController.animateTo(
      500,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff100B20),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage));
    } else {
      return FadeTransition(
        opacity: _animation,
        child: Column(
          children: [
            const SizedBox(height:30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/Logo.png",
                    height: 19,
                  ),
                  IconButton(
                    icon: const Icon(Icons.search_outlined, color: Colors.white),
                    onPressed: () {
                      // Implement search functionality
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Firstlistview(books: books),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'Best Sellers',
                        style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const BestSellerListView(),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

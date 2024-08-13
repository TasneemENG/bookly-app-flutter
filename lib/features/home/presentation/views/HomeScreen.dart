import 'package:bookly_app/features/home/presentation/views/widgets/BestSellerListView.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/FirstListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import '../manger/all_books/newst_books_cubit.dart';

import '../manger/best_sellers/featured_books_cubit.dart';
import '../manger/best_sellers/featured_books_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();

    // Fetch the books using the cubits
    context.read<NewstBooksCubit>().fetchNewstBooks();
    context.read<FeaturedBooksCubit>().fetchFeaturedBooks();
  }

  void _scrollToPosition() {
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
      body: FadeTransition(
        opacity: _animation,
        child: Column(
          children: [
            const SizedBox(height: 30),
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
                  BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
                    builder: (context, state) {
                      if (state is FeaturedBooksLoading) {
                        return const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (state is FeaturedBooksFailure) {
                        return SliverToBoxAdapter(
                          child: Center(child: Text(state.errMessage)),
                        );
                      } else if (state is FeaturedBooksSuccess) {
                        _scrollToPosition(); // Scroll to position after loading
                        return SliverToBoxAdapter(
                          child: Firstlistview(books: state.books),
                        );
                      }
                      return const SliverToBoxAdapter();
                    },
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
                  BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
                    builder: (context, state) {
                      if (state is FeaturedBooksLoading) {
                        return const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (state is FeaturedBooksFailure) {
                        return SliverToBoxAdapter(
                          child: Center(child: Text(state.errMessage)),
                        );
                      } else if (state is FeaturedBooksSuccess) {
                        return NewstBooksListView();
                      }
                      return const SliverToBoxAdapter();
                    },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/all_books/newst_books_cubit.dart';
import '../../manger/all_books/newst_books_state.dart';
import 'BestSellerBookCard.dart';

class NewstBooksListView extends StatelessWidget {
  const NewstBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewstBooksCubit, NewstBooksState>(
      builder: (context, state) {
        if (state is NewstBooksLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is NewstBooksFaliures) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.error)),
          );
        } else if (state is NewstBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final book = state.books[index];
                return BestSellerBookCard(book: book);
              },
              childCount: state.books.length,
            ),
          );
        }
        return const SliverToBoxAdapter(); // Return an empty widget if state doesn't match
      },
    );
  }
}

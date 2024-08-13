
import 'package:bookly_app/core/utils/serviceLocator.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/features/home/data/models/books/books.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/presentation/manger/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/HomeScreen.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/BookDetailScreen.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) {
          final book = state.extra as Books;
          return BlocProvider(
            create: (context) => SimilarBooksCubit(
              getIt.get<HomeRepoImpl>(),
            ),
            child: DetailsScreen(
              book: book,
            ),
          );
        },
      ),
    ],
  );
}

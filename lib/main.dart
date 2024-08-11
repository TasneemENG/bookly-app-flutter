import 'package:bookly_app/features/home/data/models/books/books.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_screen.dart';

import 'features/home/presentation/views/widgets/BookDetailScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "SplashScreen": (context) => const SplashScreen(),
        "/details": (context) => DetailsScreen(book: Books()),
      },
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: const Color(0xff100B20),
      ),
      home: const SplashScreen(),
    );
  }
}

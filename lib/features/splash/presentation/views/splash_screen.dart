import 'package:flutter/material.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/splash_body.dart';

import '../../../home/presentation/views/HomeScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Example: Navigate to HomeScreen after 4 seconds (same duration as your animation)
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}

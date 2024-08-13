import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    slidingAnimation = Tween<Offset>(begin: const Offset(0, 7), end: Offset.zero)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.forward();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ScaleTransition(
          scale: scaleAnimation,
          child: Image.asset(AssetsData.logo),
        ),
        const SizedBox(height: 20),
        Center(
          child: SlideTransition(
            position: slidingAnimation,
            child: const Text(
              "Read Free Books",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void navigateToHome() {
      Future.delayed(
        const Duration(seconds: 2),
            () {

          GoRouter.of(context).push(AppRouter.kHomeView);
        },
      );
    }
}

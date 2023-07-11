import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';
import 'package:teste_eclipse/modules/splash/controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    super.initState();
    controller.initSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultWhite,
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash_animation.json',
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}

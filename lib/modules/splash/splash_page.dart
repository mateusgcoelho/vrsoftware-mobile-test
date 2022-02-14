import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future<void> timeOutSplashScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    timeOutSplashScreen(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          AppImages.logo,
          width: 360,
        ),
      ),
    );
  }
}

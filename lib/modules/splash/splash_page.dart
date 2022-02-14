import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}

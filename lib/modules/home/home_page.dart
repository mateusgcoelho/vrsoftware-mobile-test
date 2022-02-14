import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Text(
            "Cursos",
            style: AppTexts.appBar,
          ),
        ),
      ),
      body: Text("oi"),
    );
  }
}

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
        preferredSize: Size.fromHeight(120),
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 24, right: 24),
            title: Text(
              "Cursos",
              style: AppTexts.appBar,
            ),
            trailing: InkWell(
              onTap: () {},
              child: Ink(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primary,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Text("oi"),
    );
  }
}

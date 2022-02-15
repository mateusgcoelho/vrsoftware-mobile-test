import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class TabItemWidget extends StatelessWidget {
  final String title;

  const TabItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      child: Ink(
        child: Column(
          children: [
            Container(
              color: AppColors.primaryLight,
              width: size.width,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this.title,
                    style: AppTexts.buttonTabItem,
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              color: AppColors.primary,
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}

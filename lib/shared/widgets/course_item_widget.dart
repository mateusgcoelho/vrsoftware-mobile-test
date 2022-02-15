import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class CourseItemWidget extends StatelessWidget {
  const CourseItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "INFORMATICA BASICA",
              style: AppTexts.courseItemTitle,
            ),
            IconButton(
              icon: Icon(Icons.chevron_right),
              iconSize: 32,
              color: AppColors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class CourseItemWidget extends StatelessWidget {
  final String name;
  final Function() onTap;

  const CourseItemWidget({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        child: Ink(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.name,
                style: AppTexts.courseItemTitle,
              ),
              Icon(
                Icons.chevron_right,
                size: 24,
                color: AppColors.gray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class CourseItemWidget extends StatelessWidget {
  final String name;

  const CourseItemWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: Ink(
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.name,
                style: AppTexts.courseItemTitle,
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                iconSize: 24,
                color: AppColors.gray,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

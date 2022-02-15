import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class StudentItemWidget extends StatelessWidget {
  const StudentItemWidget({Key? key}) : super(key: key);

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "João Mateus",
                    style: AppTexts.courseItemTitle,
                  ),
                  Text(
                    "02/15/2022",
                    style: AppTexts.courseItemTitle,
                  ),
                ],
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

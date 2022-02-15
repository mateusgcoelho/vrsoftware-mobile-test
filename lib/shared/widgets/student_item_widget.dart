import 'package:flutter/material.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class StudentItemWidget extends StatelessWidget {
  final StudentModel student;

  const StudentItemWidget({
    Key? key,
    required this.student,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.student.name,
                    style: AppTexts.courseItemTitle,
                  ),
                  Text(
                    this.student.createdAt,
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

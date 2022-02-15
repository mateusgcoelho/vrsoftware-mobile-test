import 'package:flutter/material.dart';
import 'package:mobile/models/course_model.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/student_item_widget.dart';
import 'package:mobile/shared/widgets/tab_item_widget.dart';

class CourseViewPage extends StatelessWidget {
  final CourseModel course;

  const CourseViewPage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 136,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                    ),
                    color: AppColors.primary,
                    iconSize: 26,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    course.description,
                    style: AppTexts.courseInfoAppBar,
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.auto_fix_high,
                    ),
                    color: AppColors.gray,
                    iconSize: 26,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Text(
                  course.ementa,
                  style: AppTexts.courseInfoDescription,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                ),
                child: Row(
                  children: [
                    TabItemWidget(
                      title: "ALUNOS",
                    ),
                  ],
                ),
              ),
              Column(
                children: course.students
                    .map((studentCourse) => StudentItemWidget(
                          name: studentCourse.name,
                          subTitleName: studentCourse.createdAt,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/student_view",
                              arguments: studentCourse,
                            );
                          },
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

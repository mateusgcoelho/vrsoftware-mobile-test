import 'package:flutter/material.dart';
import 'package:mobile/models/course_model.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/student/student_item_widget.dart';
import 'package:mobile/shared/widgets/tab_item/tab_item_widget.dart';

class StudentViewPage extends StatelessWidget {
  final StudentModel student;

  const StudentViewPage({
    Key? key,
    required this.student,
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
                  student.name,
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
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Data de Registro: ",
                          style: AppTexts.courseInfoDescription,
                          children: [
                            TextSpan(
                              text: student.createdAt,
                              style: AppTexts.courseInfoDescriptionBold,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text.rich(
                          TextSpan(
                            text: "Cursos: \n",
                            style: AppTexts.courseInfoDescription,
                            children: student.courses.length <= 0
                                ? [
                                    TextSpan(
                                      text: "Nenhum curso atualmente!",
                                      style: TextStyle(
                                        color: Colors.red[400],
                                      ),
                                    ),
                                  ]
                                : student.courses
                                    .map((course) => TextSpan(
                                          text: course.description,
                                          style: AppTexts
                                              .courseInfoDescriptionBold,
                                        ))
                                    .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(children: []),
            ],
          ),
        ],
      ),
    );
  }
}

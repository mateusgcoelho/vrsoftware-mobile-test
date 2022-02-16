import 'package:flutter/material.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/modules/student_view/student_view_controller.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/button/button_widget.dart';
import 'package:mobile/shared/widgets/default_edit_modal/default_edit_modal_widget.dart';

class StudentViewPage extends StatefulWidget {
  final StudentModel student;

  const StudentViewPage({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  _StudentViewPageState createState() => _StudentViewPageState();
}

class _StudentViewPageState extends State<StudentViewPage> {
  final controller = StudentViewController();

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
                  widget.student.name,
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
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DefaultEditModalWidget(
                            onEdit: () {
                              Navigator.pushNamed(
                                context,
                                "/update_student",
                                arguments: widget.student,
                              );
                            },
                            onDelete: () {
                              controller.deleteStudent(
                                context: context,
                                id: widget.student.id,
                              );
                            },
                          );
                        });
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
                              text: widget.student.createdAt,
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
                            children: widget.student.courses.length <= 0
                                ? [
                                    TextSpan(
                                      text: "Nenhum curso atualmente!",
                                      style: TextStyle(
                                        color: Colors.red[400],
                                      ),
                                    ),
                                  ]
                                : widget.student.courses
                                    .map((course) => TextSpan(
                                          text: course.description + "\n",
                                          style: AppTexts
                                              .courseInfoDescriptionBold,
                                        ))
                                    .toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ButtonWidget(
                        text: "Matricular",
                        onTap: () {
                          Navigator.pushNamed(context, "/enroll_student",
                              arguments: widget.student);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

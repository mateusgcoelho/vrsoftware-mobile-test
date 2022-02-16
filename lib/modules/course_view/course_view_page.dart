import 'package:flutter/material.dart';
import 'package:mobile/models/course_model.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/modules/course_view/course_view_controller.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/default_edit_modal/default_edit_modal_widget.dart';
import 'package:mobile/shared/widgets/student/student_item_widget.dart';
import 'package:mobile/shared/widgets/tab_item/tab_item_widget.dart';

class CourseViewPage extends StatefulWidget {
  final CourseModel course;

  const CourseViewPage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  _CourseViewPageState createState() => _CourseViewPageState();
}

class _CourseViewPageState extends State<CourseViewPage> {
  final controller = CourseViewController();

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
                    widget.course.description,
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
                                  "/update_course",
                                  arguments: widget.course,
                                );
                              },
                              onDelete: () {
                                controller.deleteCourse(
                                  context: context,
                                  code: widget.course.code,
                                );
                              },
                            );
                          });
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
                  widget.course.ementa,
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
                children: widget.course.students
                    .map((studentCourse) => StudentItemWidget(
                          name: studentCourse.name,
                          subTitleName: studentCourse.createdAt,
                          onActionIconButton: () {
                            controller.unsubscribeStudent(
                              context: context,
                              student: studentCourse,
                              code: widget.course.code,
                            );
                          },
                          iconDataButton: Icons.close,
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

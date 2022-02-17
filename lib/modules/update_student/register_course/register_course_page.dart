import 'package:flutter/material.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/modules/update_student/register_course/register_course_controller.dart';
import 'package:mobile/providers/app_provider.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/button/button_widget.dart';
import 'package:mobile/shared/widgets/dropdown/dropdown_button_widget.dart';
import 'package:mobile/shared/widgets/input/input_widget.dart';
import "package:provider/provider.dart";

class RegisterCoursePage extends StatefulWidget {
  final StudentModel student;

  const RegisterCoursePage({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  _RegisterCoursePageState createState() => _RegisterCoursePageState();
}

class _RegisterCoursePageState extends State<RegisterCoursePage> {
  final controller = RegisterCourseController();

  @override
  void initState() {
    if (context.read<AppProvider>().courses.length > 0) {
      controller.onChange(
          courseCode: context.read<AppProvider>().courses[0]["code"]);
    }
    controller.onChange(name: widget.student.name);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
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
                      "Matricular",
                      style: AppTexts.courseInfoAppBar,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 48,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    DropdownButtonWidget(
                      initialValue:
                          context.read<AppProvider>().courses.length == 0
                              ? ""
                              : context
                                  .read<AppProvider>()
                                  .courses[0]["code"]
                                  .toString(),
                      list: context.read<AppProvider>().courses,
                      onChangedValue: (value) {
                        final numberValue = int.parse(value);

                        controller.onChange(
                          courseCode: numberValue,
                        );
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    context.read<AppProvider>().courses.length != 0
                        ? ButtonWidget(
                            onTap: () {
                              controller.submit(context, widget.student);
                            },
                            text: "Matricular",
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

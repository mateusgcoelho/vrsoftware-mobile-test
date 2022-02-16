import 'package:flutter/material.dart';
import 'package:mobile/models/course_model.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/modules/update_course/update_course_controller.dart';
import 'package:mobile/modules/update_student/update_student_controller.dart';
import 'package:mobile/providers/app_provider.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/button/button_widget.dart';
import 'package:mobile/shared/widgets/dropdown/dropdown_button_widget.dart';
import 'package:mobile/shared/widgets/input/input_widget.dart';
import "package:provider/provider.dart";

class UpdateCoursePage extends StatefulWidget {
  final CourseModel course;

  const UpdateCoursePage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  _UpdateCoursePageState createState() => _UpdateCoursePageState();
}

class _UpdateCoursePageState extends State<UpdateCoursePage> {
  final controller = UpdateCourseController();

  @override
  void initState() {
    controller.onChange(
      description: widget.course.description,
    );
    controller.onChange(
      ementa: widget.course.ementa,
    );

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
                      "Editar Curso",
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
                    InputTextWidget(
                      labelText: "Nome",
                      initialValue: widget.course.description,
                      onChanged: (value) {
                        controller.onChange(description: value);
                      },
                      validator: controller.validateDescription,
                    ),
                    InputTextWidget(
                      labelText: "Descrição",
                      initialValue: widget.course.ementa,
                      minLines: 6,
                      maxLines: 6,
                      onChanged: (value) {
                        controller.onChange(ementa: value);
                      },
                      validator: controller.validateEmenta,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ButtonWidget(
                      onTap: () {
                        controller.submit(context, widget.course,
                            widget.course.code.toString());
                      },
                      text: "Atualizar",
                    ),
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

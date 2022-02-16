import 'package:flutter/material.dart';
import 'package:mobile/modules/create_course/create_course_controller.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/button/button_widget.dart';
import 'package:mobile/shared/widgets/input/input_widget.dart';

class CreateCoursePage extends StatefulWidget {
  @override
  _CreateCoursePageState createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {
  final controller = CreateCourseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Novo curso",
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
                      onChanged: (value) {
                        controller.onChange(description: value);
                      },
                      validator: controller.validateDescription,
                    ),
                    InputTextWidget(
                      labelText: "Descrição",
                      minLines: 8,
                      maxLines: 8,
                      onChanged: (value) {
                        controller.onChange(ementa: value);
                      },
                      validator: controller.validateEmenta,
                    ),
                    ButtonWidget(
                      text: "Cadastrar",
                      onTap: () {
                        controller.submit(context);
                      },
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

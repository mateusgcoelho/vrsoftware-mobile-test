import 'package:flutter/material.dart';
import 'package:mobile/models/student_model.dart';
import 'package:mobile/modules/update_student/update_student_controller.dart';
import 'package:mobile/providers/app_provider.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/button/button_widget.dart';
import 'package:mobile/shared/widgets/dropdown/dropdown_button_widget.dart';
import 'package:mobile/shared/widgets/input/input_widget.dart';
import "package:provider/provider.dart";

class UpdateStudentPage extends StatefulWidget {
  final StudentModel student;

  const UpdateStudentPage({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  _UpdateStudentPageState createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  final controller = UpdateStudentController();

  @override
  void initState() {
    controller.onChange(name: widget.student.name);
    controller.onChange(
        courseCode: context.read<AppProvider>().courses[0]["code"]);

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
                      "Editar Aluno",
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
                      initialValue: widget.student.name,
                      onChanged: (value) {
                        controller.onChange(name: value);
                      },
                      validator: controller.validateName,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ButtonWidget(
                      onTap: () {
                        controller.submit(context, widget.student);
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

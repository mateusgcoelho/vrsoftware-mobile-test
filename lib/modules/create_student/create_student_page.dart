import 'package:flutter/material.dart';
import 'package:mobile/providers/app_provider.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/button_widget.dart';
import 'package:mobile/shared/widgets/dropdown_button_widget.dart';
import 'package:mobile/shared/widgets/input_widget.dart';
import "package:provider/provider.dart";

class CreateStudentPage extends StatefulWidget {
  @override
  _CreateStudentPageState createState() => _CreateStudentPageState();
}

class _CreateStudentPageState extends State<CreateStudentPage> {
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
                      "Novo Aluno",
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
                child: Column(
                  children: [
                    InputTextWidget(labelText: "Nome", onChanged: (value) {}),
                    SizedBox(
                      height: 12,
                    ),
                    DropdownButtonWidget(
                      initialValue: context.read<AppProvider>().coursesName[0],
                      list: context.read<AppProvider>().coursesName,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ButtonWidget(
                      text: "Cadastrar",
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

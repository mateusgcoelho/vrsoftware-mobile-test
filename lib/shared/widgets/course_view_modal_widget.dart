import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/button_widget.dart';

class CourseViewModalWidget extends StatelessWidget {
  const CourseViewModalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 24,
        ),
        child: Column(
          children: [
            Text(
              "Ações disponiveis",
              style: AppTexts.modalTitle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
              ),
              child: Column(
                children: [
                  ButtonWidget(
                    iconData: Icons.edit,
                    text: "Alterar",
                  ),
                  ButtonWidget(
                    iconData: Icons.delete,
                    text: "Excluir",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:mobile/shared/widgets/button/button_widget.dart';

class DefaultEditModalWidget extends StatelessWidget {
  final Function() onDelete;
  final Function() onEdit;

  const DefaultEditModalWidget({
    Key? key,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 272,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
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
                vertical: 32,
              ),
              child: Column(
                children: [
                  ButtonWidget(
                    iconData: Icons.edit,
                    text: "Alterar",
                    onTap: this.onEdit,
                  ),
                  ButtonWidget(
                    iconData: Icons.delete,
                    text: "Excluir",
                    onTap: this.onDelete,
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

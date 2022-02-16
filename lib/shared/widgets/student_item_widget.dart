import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class StudentItemWidget extends StatelessWidget {
  final String name;
  final String subTitleName;
  final Function()? onTap;
  final Function()? onActionIconButton;
  final IconData? iconDataButton;

  const StudentItemWidget({
    Key? key,
    this.onTap,
    required this.name,
    required this.subTitleName,
    this.onActionIconButton,
    this.iconDataButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: this.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Ink(
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.name,
                    style: AppTexts.courseItemTitle,
                  ),
                  Text(
                    this.subTitleName,
                    style: AppTexts.courseItemTitle,
                  ),
                ],
              ),
              this.onActionIconButton != null
                  ? IconButton(
                      icon: Icon(
                        this.iconDataButton,
                        color: AppColors.primary,
                      ),
                      onPressed: this.onActionIconButton,
                    )
                  : Icon(
                      Icons.chevron_right,
                      size: 24,
                      color:
                          this.onTap != null ? AppColors.gray : AppColors.white,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

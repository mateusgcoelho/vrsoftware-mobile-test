import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class ButtonWidget extends StatelessWidget {
  final bool? enable;
  final String text;
  final IconData? iconData;

  const ButtonWidget({
    Key? key,
    this.enable = true,
    required this.text,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        enableFeedback: this.enable,
        onTap: this.enable == true ? () {} : null,
        child: Ink(
          decoration: BoxDecoration(
            color:
                this.enable == true ? AppColors.primaryLight : AppColors.white,
          ),
          width: double.infinity,
          height: 58,
          child: Align(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconData != null
                      ? Icon(
                          iconData,
                          size: 24,
                          color: AppColors.primary,
                        )
                      : Container(),
                  Text(
                    this.text,
                    style: AppTexts.buttonText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

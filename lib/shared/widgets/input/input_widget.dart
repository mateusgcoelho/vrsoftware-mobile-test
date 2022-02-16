import "package:flutter/material.dart";
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';

class InputTextWidget extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? enable;
  final bool? obscureText;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final void Function(String value) onChanged;

  const InputTextWidget({
    Key? key,
    this.labelText,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
    this.enable = true,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextFormField(
            initialValue: this.initialValue,
            validator: this.validator,
            controller: this.controller,
            enabled: this.enable,
            maxLines: this.maxLines,
            minLines: this.minLines,
            obscureText: this.obscureText!,
            enableSuggestions: this.enableSuggestions!,
            autocorrect: this.autocorrect!,
            keyboardType: this.keyboardType,
            style: AppTexts.input,
            onChanged: this.onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 24,
              ),
              hintText: this.labelText,
              hintStyle: AppTexts.input,
              fillColor: (this.enable == null || this.enable == true)
                  ? AppColors.white
                  : AppColors.backgroundInputDisabled,
              filled: false,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: AppColors.primaryLight,
            height: 2,
          ),
        ],
      ),
    );
  }
}

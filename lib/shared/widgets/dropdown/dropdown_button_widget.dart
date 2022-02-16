import 'package:flutter/material.dart';
import 'package:mobile/providers/app_provider.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_texts.dart';
import 'package:provider/provider.dart';

class DropdownButtonWidget extends StatefulWidget {
  final String initialValue;
  final dynamic list;
  final Function(String value) onChangedValue;

  const DropdownButtonWidget({
    Key? key,
    required this.initialValue,
    required this.list,
    required this.onChangedValue,
  }) : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String _selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return widget.list.length <= 0
        ? Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 40,
            ),
            child: Container(
              child: Text(
                "Nenhuma matéria existente!",
                style: TextStyle(
                  color: Colors.red[400],
                ),
              ),
            ),
          )
        : DropdownButton<String>(
            value: _selectedItem.isEmpty ? widget.initialValue : _selectedItem,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 0,
            isExpanded: true,
            underline: Container(
              height: 2,
              color: AppColors.primaryLight,
            ),
            onChanged: (String? newValue) {
              widget.onChangedValue(newValue!);

              setState(() {
                _selectedItem = newValue;
              });
            },
            items: widget.list.map<DropdownMenuItem<String>>((course) {
              return DropdownMenuItem<String>(
                value: course["code"].toString(),
                child: Text(
                  course["description"],
                  style: AppTexts.buttonText,
                ),
              );
            }).toList(),
          );
  }
}

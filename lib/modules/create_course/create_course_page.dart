import 'package:flutter/material.dart';
import 'package:mobile/shared/widgets/button_widget.dart';
import 'package:mobile/shared/widgets/input_widget.dart';

class CreateCoursePage extends StatelessWidget {
  const CreateCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Curso"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 32,
            ),
            child: Form(
              child: Column(
                children: [
                  InputTextWidget(labelText: "Nome", onChanged: (value) {}),
                  InputTextWidget(
                    labelText: "Descrição",
                    minLines: 4,
                    maxLines: 4,
                    onChanged: (value) {},
                  ),
                  ButtonWidget(
                    text: "Registrar",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

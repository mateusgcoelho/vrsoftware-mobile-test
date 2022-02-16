import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;
import 'package:mobile/models/course_model_request.dart';

class CreateCourseController {
  final formKey = GlobalKey<FormState>();

  CourseModelRequest model = CourseModelRequest();

  String? validateDescription(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateEmenta(String? value) =>
      value?.isEmpty ?? true ? "A descrição não pode ser vazia" : null;

  void onChange({String? description, String? ementa}) {
    model = model.copyWith(description: description, ementa: ementa);
  }

  Future<void> createCourseService(BuildContext context) async {
    Map<String, dynamic> body = {
      'description': model.description,
      'ementa': model.ementa
    };

    var url = Uri.parse(dotenv.env['API_URL']! + "/courses");
    await http
        .post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    )
        .then((response) {
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, "/home");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(model.description! + " criado com sucesso!"),
          ),
        );
      } else {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erro ao criar novo curso!"),
          ),
        );
      }
    }).catchError((error) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao criar novo curso!"),
        ),
      );
    });
  }

  Future<void> submit(BuildContext context) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await createCourseService(context);
    }
  }
}

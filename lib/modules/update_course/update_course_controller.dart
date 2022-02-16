import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:mobile/models/course_model_request.dart';

class UpdateCourseController {
  final formKey = GlobalKey<FormState>();

  CourseModelRequest model = CourseModelRequest();

  String? validateDescription(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateEmenta(String? value) =>
      value?.isEmpty ?? true ? "A descrição não pode ser vazia" : null;

  void onChange({String? description, String? ementa}) {
    model = model.copyWith(description: description, ementa: ementa);
  }

  Future<void> updateCourseService(
      BuildContext context, course, codeCourse) async {
    Map<String, dynamic> body = {
      'description': model.description,
      'ementa': model.ementa
    };

    var url = Uri.parse(
        "http://192.168.1.221:3030/v1/courses/" + codeCourse.toString());
    await http
        .put(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    )
        .then((response) {
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, "/home");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(model.description! + " atualizado com sucesso!"),
          ),
        );
      } else {
        Navigator.pop(context);
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erro ao atualizar curso!"),
          ),
        );
      }
    }).catchError((error) {
      Navigator.pop(context);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao atualizar curso!"),
        ),
      );
    });
  }

  Future<void> submit(BuildContext context, course, codeCourse) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await updateCourseService(context, course, codeCourse);
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:mobile/models/student_model_request.dart';

class UpdateStudentController {
  final formKey = GlobalKey<FormState>();

  StudentModelRequest model = StudentModelRequest();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateCode(double value) =>
      value.isNaN ? "Insira um codigo valido!" : null;

  void onChange({String? name, int? courseCode}) {
    model = model.copyWith(name: name, courseCode: courseCode);
  }

  Future<void> updateStudentService(BuildContext context, student) async {
    Map<String, dynamic> body = model.courseCode == null
        ? {
            'name': model.name,
          }
        : {
            'name': model.name,
            'courses': [
              {
                'code': model.courseCode,
              }
            ]
          };

    var url = Uri.parse(
        "http://192.168.1.221:3030/v1/students/" + student.id.toString());
    await http
        .put(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    )
        .then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, "/home");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(model.name! + " atualizado com sucesso!"),
          ),
        );
      } else {
        Navigator.pushReplacementNamed(context, "/student_view",
            arguments: student);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erro ao atualizar estudante!"),
          ),
        );
      }
    }).catchError((error) {
      Navigator.pushReplacementNamed(context, "/student_view",
          arguments: student);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao atualizar estudante!"),
        ),
      );
    });
  }

  Future<void> submit(BuildContext context, student) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await updateStudentService(context, student);
    }
  }
}

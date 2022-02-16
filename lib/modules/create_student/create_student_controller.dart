import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;
import 'package:mobile/models/student_model_request.dart';

class CreateStudentController {
  final formKey = GlobalKey<FormState>();

  StudentModelRequest model = StudentModelRequest();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateCode(double value) =>
      value.isNaN ? "Insira um codigo valido!" : null;

  void onChange({String? name, int? courseCode}) {
    model = model.copyWith(name: name, courseCode: courseCode);
  }

  Future<void> createStudentService(BuildContext context) async {
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

    var url = Uri.parse(dotenv.env['API_URL']! + "/students");
    await http
        .post(
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
            content: Text(model.name! + " matriculado com sucesso!"),
          ),
        );
      } else {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erro ao matricular um novo estudante!"),
          ),
        );
      }
    }).catchError((error) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao matricular um novo estudante!"),
        ),
      );
    });
  }

  Future<void> submit(BuildContext context) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await createStudentService(context);
    }
  }
}

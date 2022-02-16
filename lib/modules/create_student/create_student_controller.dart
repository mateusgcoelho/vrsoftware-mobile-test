import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class StudentModelRequest {
  String? name;
  int? courseCode;

  StudentModelRequest({this.name, this.courseCode});

  StudentModelRequest copyWith({String? name, int? courseCode}) {
    return StudentModelRequest(
      name: name ?? this.name,
      courseCode: courseCode ?? this.courseCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'courseCode': courseCode,
    };
  }

  factory StudentModelRequest.fromMap(Map<String, dynamic> map) {
    return StudentModelRequest(
      name: map['name'],
      courseCode: map['courseCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModelRequest.fromJson(String source) =>
      StudentModelRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentModelRequest(name: $name, dueDate: $courseCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentModelRequest &&
        other.name == name &&
        other.courseCode == courseCode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ courseCode.hashCode;
  }
}

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
    Map<String, dynamic> body = {
      'name': model.name,
      'courses': [
        {
          'code': model.courseCode != null ? model.courseCode : 1,
        }
      ]
    };

    var url = Uri.parse("http://192.168.1.221:3030/v1/students");
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
            content: Text(model.name! + " matriculado com sucesso!"),
          ),
        );
      } else {
        throw Exception("Erro ao carregar os cursos!");
      }
    });
  }

  Future<void> submit(BuildContext context) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await createStudentService(context);
    }
  }
}

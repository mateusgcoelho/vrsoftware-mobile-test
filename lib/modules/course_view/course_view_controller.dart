import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CourseViewController {
  Future<void> unsubscribeStudent({context, student, code}) async {
    Map<String, dynamic> body = {
      'code': code,
    };

    var url = Uri.parse(
      "http://192.168.1.221:3030/v1/students/unsubscribe/" +
          student.id.toString(),
    );
    await http
        .patch(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    )
        .then((response) {
      if (response.statusCode == 204) {
        Navigator.pushReplacementNamed(context, "/home");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(student.name + " desmatriculado com sucesso!"),
          ),
        );
      } else {
        throw Exception("Erro ao carregar os cursos!");
      }
    });
  }
}

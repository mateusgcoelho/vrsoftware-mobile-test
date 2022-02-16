import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CourseViewController {
  bool modalEditIsVisible = false;

  toogleModalEditIsVisible() {
    modalEditIsVisible = !modalEditIsVisible;
  }

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
        throw Exception("Erro ao desmatricular o aluno!");
      }
    });
  }

  Future<void> deleteCourse({context, code}) async {
    print(code);
    var url =
        Uri.parse("http://192.168.1.221:3030/v1/courses/" + code.toString());
    await http
        .delete(
      url,
    )
        .then((response) {
      if (response.body.isEmpty) {
        Navigator.pushReplacementNamed(context, "/home");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Curso deletado com sucesso!"),
          ),
        );
      } else {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Esse curso ainda tem alunos!"),
          ),
        );
      }
    }).catchError((error) {
      print(error);
      throw Exception("Erro ao deletar os cursos!");
    });
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StudentViewController {
  Future<void> deleteStudent({context, id}) async {
    var url = Uri.parse(dotenv.env['API_URL']! + "/students/" + id.toString());
    await http
        .delete(
      url,
    )
        .then((response) {
      if (response.body.isEmpty) {
        Navigator.pushReplacementNamed(context, "/home");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Aluno deletado com sucesso!"),
          ),
        );
      } else {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Esse Aluno ainda tem cursos!"),
          ),
        );
      }
    }).catchError((error) {
      throw Exception("Erro ao deletar o aluno!");
    });
  }
}

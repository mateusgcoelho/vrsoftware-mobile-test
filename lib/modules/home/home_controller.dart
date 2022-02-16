import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/providers/app_provider.dart';
import 'package:provider/provider.dart';
import "package:http/http.dart" as http;

class HomeController {
  int currentPage = 0;

  setPage(index) {
    currentPage = index;
  }

  Future<List> getAllCourses(BuildContext context) async {
    var url = Uri.parse(dotenv.env['API_URL']! + "/courses");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      context.read<AppProvider>().setCourses(responseJson);

      return responseJson;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao procurar os cursos!"),
        ),
      );

      throw Exception("Erro ao carregar os cursos!");
    }
  }

  Future<List> getAllStudents(BuildContext context) async {
    var url = Uri.parse(dotenv.env['API_URL']! + "/students");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao procurar os cursos!"),
        ),
      );

      throw Exception("Erro ao carregar os alunos!");
    }
  }
}

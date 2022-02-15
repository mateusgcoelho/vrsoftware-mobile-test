import 'dart:convert';

import "package:http/http.dart" as http;

class HomeController {
  int currentPage = 0;

  setPage(index) {
    currentPage = index;
  }

  Future<List> getAllCourses() async {
    var url = Uri.parse("http://192.168.1.221:3030/v1/courses");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception("Erro ao carregar os cursos!");
    }
  }
}

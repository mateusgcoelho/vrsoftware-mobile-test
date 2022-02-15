import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  List<dynamic> _courses = [];
  List<String> _coursesName = [];

  List<dynamic> get courses => _courses;
  List<String> get coursesName => _coursesName;

  void setCourses(List<dynamic> courses) {
    _courses = courses;

    _coursesName =
        courses.map((course) => course["description"].toString()).toList();

    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/models/course_model.dart';

class AppProvider with ChangeNotifier {
  List<dynamic> _courses = [];

  List<dynamic> get courses => _courses;

  void setCourses(List<dynamic> courses) {
    _courses = courses;
  }
}

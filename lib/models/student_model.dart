import 'package:mobile/models/course_model.dart';

class StudentModel {
  final String name;
  final List courses;
  final String createdAt;

  StudentModel(this.name, this.courses, this.createdAt);

  factory StudentModel.fromJson(dynamic json) {
    List tempList = List.from(json["courses"]);

    List<CourseModel> newList = tempList
        .map((item) => CourseModel(item["description"], item["ementa"],
            item["students"], item["created_at"]))
        .toList();

    return StudentModel(json["name"], newList, json["created_at"]);
  }
}

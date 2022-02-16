import 'package:mobile/models/course_model.dart';

class StudentModel {
  final int id;
  final String name;
  final List courses;
  final String createdAt;

  StudentModel({
    required this.id,
    required this.name,
    required this.courses,
    required this.createdAt,
  });

  factory StudentModel.fromJson(dynamic json) {
    List tempList = List.from(json["courses"]);

    List<CourseModel> newList = tempList
        .map(
          (item) => CourseModel(
            code: item["code"],
            description: item["description"],
            ementa: item["ementa"],
            students: item["students"],
            createdAt: item["created_at"],
          ),
        )
        .toList();

    return StudentModel(
        id: json["id"],
        name: json["name"],
        courses: newList,
        createdAt: json["created_at"]);
  }
}

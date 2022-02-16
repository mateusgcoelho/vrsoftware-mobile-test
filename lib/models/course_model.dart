import 'package:mobile/models/student_model.dart';

class CourseModel {
  final int code;
  final String description;
  final String ementa;
  final List<StudentModel> students;
  final String createdAt;

  CourseModel(
      {required this.description,
      required this.ementa,
      required this.students,
      required this.createdAt,
      required this.code});

  factory CourseModel.fromJson(dynamic json) {
    List tempList = List.from(json["students"]);

    List<StudentModel> newList = tempList
        .map(
          (item) => StudentModel(
            id: item["id"],
            name: item["name"],
            courses: item["courses"],
            createdAt: item["created_at"],
          ),
        )
        .toList();

    return CourseModel(
        code: json["code"],
        description: json["description"],
        ementa: json["ementa"],
        students: newList,
        createdAt: json["created_at"]);
  }
}

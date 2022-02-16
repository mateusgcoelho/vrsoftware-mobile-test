import 'package:mobile/models/student_model.dart';

class CourseModel {
  final String description;
  final String ementa;
  final List<StudentModel> students;
  final String createdAt;

  CourseModel(this.description, this.ementa, this.students, this.createdAt);

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
        json["description"], json["ementa"], newList, json["created_at"]);
  }
}

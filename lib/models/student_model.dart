class StudentModel {
  final String name;
  final int courseCode;
  final String createdAt;

  StudentModel(this.name, this.courseCode, this.createdAt);

  factory StudentModel.fromJson(dynamic json) {
    return StudentModel(json["name"], json["course_code"], json["created_At"]);
  }
}

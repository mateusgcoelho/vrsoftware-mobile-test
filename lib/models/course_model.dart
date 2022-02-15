class CourseModel {
  final String description;
  final String ementa;

  CourseModel(this.description, this.ementa);

  factory CourseModel.fromJson(dynamic json) {
    print(json);
    return CourseModel(json["description"], json["ementa"]);
  }
}

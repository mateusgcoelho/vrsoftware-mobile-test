import 'dart:convert';

class StudentModelRequest {
  String? name;
  int? courseCode;

  StudentModelRequest({this.name, this.courseCode});

  StudentModelRequest copyWith({String? name, int? courseCode}) {
    return StudentModelRequest(
      name: name ?? this.name,
      courseCode: courseCode ?? this.courseCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'courseCode': courseCode,
    };
  }

  factory StudentModelRequest.fromMap(Map<String, dynamic> map) {
    return StudentModelRequest(
      name: map['name'],
      courseCode: map['courseCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModelRequest.fromJson(String source) =>
      StudentModelRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentModelRequest(name: $name, dueDate: $courseCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentModelRequest &&
        other.name == name &&
        other.courseCode == courseCode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ courseCode.hashCode;
  }
}

import 'dart:convert';

class CourseModelRequest {
  String? description;
  String? ementa;

  CourseModelRequest({this.description, this.ementa});

  CourseModelRequest copyWith({String? description, String? ementa}) {
    return CourseModelRequest(
      description: description ?? this.description,
      ementa: ementa ?? this.ementa,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'ementa': ementa,
    };
  }

  factory CourseModelRequest.fromMap(Map<String, dynamic> map) {
    return CourseModelRequest(
      description: map['description'],
      ementa: map['ementa'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModelRequest.fromJson(String source) =>
      CourseModelRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseModelRequest(description: $description, dueDate: $ementa)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseModelRequest &&
        other.description == description &&
        other.ementa == ementa;
  }

  @override
  int get hashCode {
    return description.hashCode ^ ementa.hashCode;
  }
}

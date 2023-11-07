import 'package:tpi_flutter/models/user.dart';

class Subject {
  String? id;
  int? classroom;
  String? name;
  User? professor;
  String? schedule;
  List<dynamic>? students;

  Subject({
    required this.id,
    required this.classroom,
    required this.name,
    required this.professor,
    required this.schedule,
    required this.students,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      classroom: json['classroom'],
      name: json['name'],
      professor: User.fromJson(json['professor']),
      schedule: json['schedule'],
      students: json['students'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> subject = <String, dynamic>{};
    subject['id'] = id;
    subject['classroom'] = classroom;
    subject['name'] = name;
    subject['professor'] = professor;
    subject['schedule'] = schedule;
    subject['students'] = students;
    return subject;
  }
}

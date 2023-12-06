import 'package:flutter_job_hiring/models/business.dart';

class JobTest {
  int id;
  String position;
  List<String> level;
  String salary;
  String content;
  List<String> skill;
  List<String> type;
  String requirement;
  int quantity;
  String benefits;
  BusinessTest business;

  JobTest({
    required this.id,
    required this.position,
    required this.level,
    required this.salary,
    required this.content,
    required this.skill,
    required this.type,
    required this.requirement,
    required this.quantity,
    required this.benefits,
    required this.business,
  });

  factory JobTest.fromJson(Map<String, dynamic> json) {
    return JobTest(
      id: json['id'],
      position: json['position'],
      level: List<String>.from(json['level']),
      salary: json['salary'],
      content: json['content'],
      skill: List<String>.from(json['skill']),
      type: List<String>.from(json['type']),
      requirement: json['requirement'],
      quantity: json['quantity'],
      benefits: json['benefits'],
      business: BusinessTest.fromJson(json['business']),
    );
  }

}

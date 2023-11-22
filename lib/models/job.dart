class Job {
  final int id;
  final String position;
  final List level;
  final String salary;
  final String content;
  final List skill;
  final List type;
  final String requirement;
  final int quantity;
  final String benefits;
  final String avatar;
  final String name;
  final String location;
  Job(
      {required this.avatar,
      required this.name,
      required this.location,
      required this.id,
      required this.position,
      required this.level,
      required this.salary,
      required this.content,
      required this.skill,
      required this.type,
      required this.requirement,
      required this.quantity,
      required this.benefits});

  factory Job.fromJson(dynamic json) {
    return Job(
      avatar: json['business']['avatar'] as String,
      name: json['business']['name'] as String,
      location: json['business']['location'] as String,
      id: json['id'] as int,
      position: json['position'] as String,
      level: (json['level'] is List) ? json['level'] : [json['level'].toString()],
      salary: json['salary'] as String,
      content: json['content'] as String,
      skill: (json['skill'] is List) ? json['skill'] : [json['skill'].toString()],
      type: (json['type'] is List) ? json['type'] : [json['type'].toString()],
      requirement: json['requirement'] as String,
      quantity: json['quantity'] as int,
      benefits: json['benefits'] as String,
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return ("job {id: $id, position: $position, level: $level, salary : $salary, content: $content, skill: $skill, type: $type, requirement: $requirement,quantity: $quantity, benefits: $benefits}");
  }
}

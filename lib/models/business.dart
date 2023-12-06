
class BusinessTest {
  final int id;
  final String name;
  final String avatar;
  final String email;
  final String phone;
  final String location;
  final String career;
  final int size;

  BusinessTest({
    required this.phone,
    required this.location,
    required this.career,
    required this.size,
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
  });

  factory BusinessTest.fromJson(Map<String, dynamic> json) {
    return BusinessTest(
      id: json['id'] as int,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      career: json['career'] as String,
      size: json['size'] as int,
    );
  }
}

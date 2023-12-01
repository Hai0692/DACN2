class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.birthday,
    this.address,
  });

  late int? id;
  late String? name;
  late String? email;
  late String? phone;
  late String? gender;
  late DateTime? birthday;
  late String? address;

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      birthday: _parseDateTime(json['birthday']),
      address: json['address'] as String?,
    );
  }

  static DateTime? _parseDateTime(dynamic date) {
    if (date == null) return null;
    if (date is String) {
      return DateTime.tryParse(date);
    }
    return null;
  }

  @override
  String toString() {
    return 'User {id: $id, name: $name, phone: $phone, email: $email, birthay: $birthday, address: $address,}';
  }
}

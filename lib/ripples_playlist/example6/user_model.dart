class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstname: json['first_name'],
      lastname: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class User {
  String? email;
  String? password;
  String? name;
  String? lastname;
  String? role;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.lastname,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      lastname: json['lastname'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['lastname'] = lastname;
    data['role'] = role;
    return data;
  }
}

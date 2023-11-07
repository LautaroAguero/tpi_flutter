class User {
  String? id;
  String? email;
  String? password;
  String? name;
  String? lastname;
  String? role;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.lastname,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      lastname: json['lastname'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{};
    user['id'] = id;
    user['email'] = email;
    user['password'] = password;
    user['name'] = name;
    user['lastname'] = lastname;
    user['role'] = role;
    return user;
  }
}

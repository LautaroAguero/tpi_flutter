class UserModel {
  int? status;
  String? data;
  User? user;

  UserModel({this.status, this.data, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? email;
  String? password;
  String? name;
  String? lastname;
  String? role;

  User(
      {this.sId,
      this.email,
      this.password,
      this.name,
      this.lastname,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    lastname = json['lastname'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['lastname'] = lastname;
    data['role'] = role;
    return data;
  }
}

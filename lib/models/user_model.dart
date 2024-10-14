class UserModel {
  String email;
  String password;

  UserModel({required this.email, required this.password});

  UserModel.fromJson({required Map<String, dynamic> map})
      : email = map['email'],
        password = map['password'];

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}

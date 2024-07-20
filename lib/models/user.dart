class User {
  dynamic id;
  dynamic avatar;
  String name;
  String email;
  dynamic password;
  dynamic phone;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      this.password,
      this.id,
      this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    if (json['avatar'] != null) {
      return User(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          phone: json['phone'],
          avatar: json['avatar']);
    } else {
      return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
      );
    }
  }
}

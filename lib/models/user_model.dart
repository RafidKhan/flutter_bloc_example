class UserModel {
  int id;
  String name;
  String username;
  String email;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
      };
}

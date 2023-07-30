import 'package:whatsapp_clone/utils/serializable.dart';

class UserModel extends Serializable {
  String id;
  String username;
  DateTime createdAt;

  UserModel({
    required this.id,
    required this.username,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "createdAt": createdAt.toIso8601String(),
      };
}

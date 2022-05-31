import 'dart:convert';

class UserModel {
  final String name;
  String? photoUrl;

  UserModel({required this.name, this.photoUrl});

  Map<String, dynamic> toMap() => {
        'name': name,
        'photoUrl': photoUrl,
      };

  String toJson() => jsonEncode(toMap());
  
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        name: map['name'],
        photoUrl: map['photoUrl'],
      );

  factory UserModel.fromJson(String json) => UserModel.fromMap(
        jsonDecode(json),
      );
}

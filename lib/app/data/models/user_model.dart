import 'dart:convert';

class UserModel {
  String? avatarPath;
  String? gravatarHash;
  String? id;
  String? name;
  String? username;

  UserModel({
    this.avatarPath,
    this.gravatarHash,
    this.id,
    this.name,
    this.username,
  });

  UserModel copyWith({
    String? avatarPath,
    String? gravatarHash,
    String? id,
    String? name,
    String? username,
  }) =>
      UserModel(
        avatarPath: avatarPath ?? this.avatarPath,
        gravatarHash: gravatarHash ?? this.gravatarHash,
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  UserModel.fromJson(Map<String, dynamic> json) {
    avatarPath = json['avatar_path'];
    gravatarHash = json['gravatar_hash'];
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  String toEncodedJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (avatarPath != null) data['avatar_path'] = avatarPath;
    if (gravatarHash != null) data['gravatar_hash'] = gravatarHash;
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (username != null) data['username'] = username;

    return data;
  }
}

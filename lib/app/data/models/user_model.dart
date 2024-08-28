import 'dart:convert';

import 'avatar_model.dart';

class UserModel {
  String? avatarPath;
  String? gravatarHash;
  String? id;
  String? name;
  String? username;
  String? iso6391;
  String? iso31661;
  bool? includeAdult;
  AvatarModel? avatar;

  UserModel({
    this.avatarPath,
    this.gravatarHash,
    this.id,
    this.name,
    this.username,
    this.iso6391,
    this.iso31661,
    this.includeAdult,
    this.avatar,
  });

  UserModel copyWith({
    String? avatarPath,
    String? gravatarHash,
    String? id,
    String? name,
    String? username,
    String? iso6391,
    String? iso31661,
    bool? includeAdult,
    AvatarModel? avatar,
  }) =>
      UserModel(
        avatarPath: avatarPath ?? this.avatarPath,
        gravatarHash: gravatarHash ?? this.gravatarHash,
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        iso6391: iso6391 ?? this.iso6391,
        iso31661: iso31661 ?? this.iso31661,
        includeAdult: includeAdult ?? this.includeAdult,
        avatar: avatar ?? this.avatar,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  UserModel.fromJson(Map<String, dynamic> json) {
    avatarPath = json['avatar_path'];
    gravatarHash = json['gravatar_hash'];
    id = json['id'];
    name = json['name'];
    username = json['username'];
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    includeAdult = json['include_adult'];
    avatar =
        json['avatar'] != null ? AvatarModel.fromJson(json['avatar']) : null;
  }

  String toEncodedJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (avatarPath != null) data['avatar_path'] = avatarPath;
    if (gravatarHash != null) data['gravatar_hash'] = gravatarHash;
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (username != null) data['username'] = username;
    if (iso6391 != null) data['iso_639_1'] = iso6391;
    if (iso31661 != null) data['iso_3166_1'] = iso31661;
    if (includeAdult != null) data['include_adult'] = includeAdult;
    if (avatar != null) data['avatar'] = avatar?.toJson();

    return data;
  }
}

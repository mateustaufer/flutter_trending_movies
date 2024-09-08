import 'dart:convert';

class TmdbModel {
  String? avatarPath;

  TmdbModel({this.avatarPath});

  TmdbModel copyWith({String? avatarPath}) =>
      TmdbModel(avatarPath: avatarPath ?? this.avatarPath);

  factory TmdbModel.fromRawJson(String str) =>
      TmdbModel.fromJson(json.decode(str));

  TmdbModel.fromJson(Map<String, dynamic> json) {
    avatarPath = json['avatar_path'];
  }

  String toEncodedJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (avatarPath != null) data['avatar_path'] = avatarPath;

    return data;
  }
}

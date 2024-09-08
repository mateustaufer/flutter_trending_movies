import 'dart:convert';

import 'gravatar_model.dart';
import 'tmdb_model.dart';

class AvatarModel {
  GravatarModel? gravatar;
  TmdbModel? tmdb;

  AvatarModel({this.gravatar, this.tmdb});

  AvatarModel copyWith({GravatarModel? gravatar, TmdbModel? tmdb}) =>
      AvatarModel(gravatar: gravatar ?? this.gravatar, tmdb: tmdb ?? this.tmdb);

  factory AvatarModel.fromRawJson(String str) =>
      AvatarModel.fromJson(json.decode(str));

  AvatarModel.fromJson(Map<String, dynamic> json) {
    gravatar = json['gravatar'] != null
        ? GravatarModel.fromJson(json['gravatar'])
        : null;
    tmdb = json['tmdb'] != null ? TmdbModel.fromJson(json['tmdb']) : null;
  }

  String toEncodedJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (gravatar != null) data['gravatar'] = gravatar!.toJson();
    if (tmdb != null) data['tmdb'] = tmdb!.toJson();

    return data;
  }
}

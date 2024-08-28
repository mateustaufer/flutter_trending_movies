import 'dart:convert';

class GravatarModel {
  String? hash;

  GravatarModel({this.hash});

  GravatarModel copyWith({String? hash}) =>
      GravatarModel(hash: hash ?? this.hash);

  factory GravatarModel.fromRawJson(String str) =>
      GravatarModel.fromJson(json.decode(str));

  GravatarModel.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
  }

  String toEncodedJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (hash != null) data['hash'] = hash;

    return data;
  }
}

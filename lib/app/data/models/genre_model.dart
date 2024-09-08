import 'dart:convert';

class GenreModel {
  int? id;
  String? name;

  GenreModel({this.id, this.name});

  GenreModel copyWith({int? id, String? name}) =>
      GenreModel(id: id ?? this.id, name: name ?? this.name);

  factory GenreModel.fromRawJson(String str) =>
      GenreModel.fromJson(json.decode(str));

  GenreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  String toEncodedJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;

    return data;
  }
}

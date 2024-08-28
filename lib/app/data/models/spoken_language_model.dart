class SpokenLanguageModel {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguageModel({this.englishName, this.iso6391, this.name});

  SpokenLanguageModel copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) =>
      SpokenLanguageModel(
        englishName: englishName ?? this.englishName,
        iso6391: iso6391 ?? this.iso6391,
        name: name ?? this.name,
      );

  SpokenLanguageModel.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (englishName != null) data['english_name'] = englishName;
    if (iso6391 != null) data['iso_639_1'] = iso6391;
    if (name != null) data['name'] = name;

    return data;
  }
}

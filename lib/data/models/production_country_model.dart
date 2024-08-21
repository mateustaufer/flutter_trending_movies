class ProductionCountryModel {
  String? iso31661;
  String? name;

  ProductionCountryModel({this.iso31661, this.name});

  ProductionCountryModel copyWith({String? iso31661, String? name}) =>
      ProductionCountryModel(
        iso31661: iso31661 ?? this.iso31661,
        name: name ?? this.name,
      );

  ProductionCountryModel.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (iso31661 != null) data['iso_3166_1'] = iso31661;
    if (name != null) data['name'] = name;

    return data;
  }
}

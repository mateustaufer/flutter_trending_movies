class ProductionCompanyModel {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanyModel({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanyModel copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) =>
      ProductionCompanyModel(
        id: id ?? this.id,
        logoPath: logoPath ?? this.logoPath,
        name: name ?? this.name,
        originCountry: originCountry ?? this.originCountry,
      );

  ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (id != null) data['id'] = id;
    if (logoPath != null) data['logo_path'] = logoPath;
    if (name != null) data['name'] = name;
    if (originCountry != null) data['origin_country'] = originCountry;

    return data;
  }
}

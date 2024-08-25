class BelongsToCollectionModel {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollectionModel({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  BelongsToCollectionModel copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) =>
      BelongsToCollectionModel(
        id: id ?? this.id,
        name: name ?? this.name,
        posterPath: posterPath ?? this.posterPath,
        backdropPath: backdropPath ?? this.backdropPath,
      );

  BelongsToCollectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (posterPath != null) data['poster_path'] = posterPath;
    if (backdropPath != null) data['backdrop_path'] = backdropPath;

    return data;
  }
}

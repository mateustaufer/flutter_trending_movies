import 'dart:convert';

class MovieModel {
  String? backdropPath;
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  DateTime? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModel({
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieModel copyWith({
    String? backdropPath,
    int? id,
    String? title,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? mediaType,
    bool? adult,
    String? originalLanguage,
    List<int>? genreIds,
    double? popularity,
    DateTime? releaseDate,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      MovieModel(
        backdropPath: backdropPath ?? this.backdropPath,
        id: id ?? this.id,
        title: title ?? this.title,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        mediaType: mediaType ?? this.mediaType,
        adult: adult ?? this.adult,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        genreIds: genreIds ?? this.genreIds,
        popularity: popularity ?? this.popularity,
        releaseDate: releaseDate ?? this.releaseDate,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory MovieModel.fromRawJson(String str) =>
      MovieModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  MovieModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = int.tryParse(json['id'].toString());
    title = json['title'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    adult = json['adult'];
    originalLanguage = json['original_language'];

    if (json['genre_ids'] != null && json['genre_ids'] is List<int>) {
      genreIds = <int>[];
      for (int v in (json['genre_ids'] as List<int>)) {
        genreIds?.add(v);
      }
    }

    popularity = json['popularity'];
    releaseDate = DateTime.tryParse(json['release_date'].toString());
    video = json['video'];
    voteAverage = double.tryParse(json['vote_average'].toString());
    voteCount = int.tryParse(json['vote_count'].toString());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (backdropPath != null) data['backdrop_path'] = backdropPath;
    if (id != null) data['id'] = id;
    if (title != null) data['title'] = title;
    if (originalTitle != null) data['original_title'] = originalTitle;
    if (overview != null) data['overview'] = overview;
    if (posterPath != null) data['poster_path'] = posterPath;
    if (mediaType != null) data['media_type'] = mediaType;
    if (adult != null) data['adult'] = adult;
    if (originalLanguage != null) data['original_language'] = originalLanguage;
    if (genreIds != null) data['genre_ids'] = genreIds;
    if (popularity != null) data['popularity'] = popularity;
    if (releaseDate != null) data['release_date'] = releaseDate;
    if (video != null) data['video'] = video;
    if (voteAverage != null) data['vote_average'] = voteAverage;
    if (voteCount != null) data['vote_count'] = voteCount;

    return data;
  }
}

import 'dart:convert';

import 'belongs_to_collection_model.dart';
import 'genre_model.dart';
import 'production_company_model.dart';
import 'production_country_model.dart';
import 'spoken_language_model.dart';

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
  BelongsToCollectionModel? belongsToCollection;
  List<GenreModel>? genres;
  String? homepage;
  String? imdbId;
  List<String>? originCountry;
  List<ProductionCompanyModel>? productionCompanies;
  List<ProductionCountryModel>? productionCountries;
  int? revenue;
  int? runtime;
  List<SpokenLanguageModel>? spokenLanguages;
  String? status;
  String? tagline;

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
    this.belongsToCollection,
    this.genres,
    this.homepage,
    this.imdbId,
    this.originCountry,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
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
    BelongsToCollectionModel? belongsToCollection,
    List<GenreModel>? genres,
    String? homepage,
    String? imdbId,
    List<String>? originCountry,
    List<ProductionCompanyModel>? productionCompanies,
    List<ProductionCountryModel>? productionCountries,
    int? revenue,
    int? runtime,
    List<SpokenLanguageModel>? spokenLanguages,
    String? status,
    String? tagline,
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
        belongsToCollection: belongsToCollection ?? this.belongsToCollection,
        genres: genres ?? this.genres,
        homepage: homepage ?? this.homepage,
        imdbId: imdbId ?? this.imdbId,
        originCountry: originCountry ?? this.originCountry,
        productionCompanies: productionCompanies ?? this.productionCompanies,
        productionCountries: productionCountries ?? this.productionCountries,
        revenue: revenue ?? this.revenue,
        runtime: runtime ?? this.runtime,
        spokenLanguages: spokenLanguages ?? this.spokenLanguages,
        status: status ?? this.status,
        tagline: tagline ?? this.tagline,
      );

  factory MovieModel.fromRawJson(String str) =>
      MovieModel.fromJson(json.decode(str));

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

    belongsToCollection = json['belongs_to_collection'] != null
        ? BelongsToCollectionModel.fromJson(json['belongs_to_collection'])
        : null;

    if (json['genres'] != null && json['genres'] is List) {
      genres = <GenreModel>[];
      for (var v in json['genres']) {
        genres?.add(GenreModel.fromJson(v));
      }
    }

    homepage = json['homepage'];
    imdbId = json['imdb_id'];

    if (json['origin_country'] != null && json['origin_country'] is List) {
      originCountry = <String>[];
      for (var v in json['origin_country']) {
        originCountry?.add(v.toString());
      }
    }

    if (json['production_companies'] != null &&
        json['production_companies'] is List) {
      productionCompanies = <ProductionCompanyModel>[];
      for (var v in json['production_companies']) {
        productionCompanies?.add(ProductionCompanyModel.fromJson(v));
      }
    }

    if (json['production_countries'] != null &&
        json['production_countries'] is List) {
      productionCountries = <ProductionCountryModel>[];
      for (var v in json['production_countries']) {
        productionCountries?.add(ProductionCountryModel.fromJson(v));
      }
    }

    revenue = int.tryParse(json['revenue'].toString());
    runtime = int.tryParse(json['runtime'].toString());

    if (json['spoken_languages'] != null && json['spoken_languages'] is List) {
      spokenLanguages = <SpokenLanguageModel>[];
      for (var v in json['spoken_languages']) {
        spokenLanguages?.add(SpokenLanguageModel.fromJson(v));
      }
    }

    status = json['status'];
    tagline = json['tagline'];
  }

  String toEncodedJson() => json.encode(toJson());

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
    if (releaseDate != null) {
      data['release_date'] = releaseDate?.toIso8601String();
    }
    if (video != null) data['video'] = video;
    if (voteAverage != null) data['vote_average'] = voteAverage;
    if (voteCount != null) data['vote_count'] = voteCount;
    if (belongsToCollection != null) {
      data['belongs_to_collection'] = belongsToCollection?.toJson();
    }
    if (genres != null) {
      data['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    if (homepage != null) data['homepage'] = homepage;
    if (imdbId != null) data['imdb_id'] = imdbId;
    if (originCountry != null) data['origin_country'] = originCountry;
    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      data['production_countries'] =
          productionCountries?.map((v) => v.toJson()).toList();
    }
    if (revenue != null) data['revenue'] = revenue;
    if (runtime != null) data['runtime'] = runtime;
    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
    }
    if (status != null) data['status'] = status;
    if (tagline != null) data['tagline'] = tagline;

    return data;
  }
}

import 'dart:convert';

import 'movie_model.dart';
import 'user_model.dart';

class MoviesListModel {
  double? averageRating;
  String? backdropPath;
  List<MovieModel>? movies;
  UserModel? user;
  String? description;
  int? id;
  String? iso31661;
  String? iso6391;
  int? itemCount;
  String? name;
  int? page;
  String? posterPath;
  bool? public;
  int? revenue;
  int? runtime;
  String? sortBy;
  int? totalPages;
  int? totalResults;

  MoviesListModel({
    this.averageRating,
    this.backdropPath,
    this.movies,
    this.user,
    this.description,
    this.id,
    this.iso31661,
    this.iso6391,
    this.itemCount,
    this.name,
    this.page,
    this.posterPath,
    this.public,
    this.revenue,
    this.runtime,
    this.sortBy,
    this.totalPages,
    this.totalResults,
  });

  MoviesListModel copyWith({
    double? averageRating,
    String? backdropPath,
    List<MovieModel>? movies,
    UserModel? user,
    String? description,
    int? id,
    String? iso31661,
    String? iso6391,
    int? itemCount,
    String? name,
    int? page,
    String? posterPath,
    bool? public,
    int? revenue,
    int? runtime,
    String? sortBy,
    int? totalPages,
    int? totalResults,
  }) =>
      MoviesListModel(
        averageRating: averageRating ?? this.averageRating,
        backdropPath: backdropPath ?? this.backdropPath,
        movies: movies ?? this.movies,
        user: user ?? this.user,
        description: description ?? this.description,
        id: id ?? this.id,
        iso31661: iso31661 ?? this.iso31661,
        iso6391: iso6391 ?? this.iso6391,
        itemCount: itemCount ?? this.itemCount,
        name: name ?? this.name,
        page: page ?? this.page,
        posterPath: posterPath ?? this.posterPath,
        public: public ?? this.public,
        revenue: revenue ?? this.revenue,
        runtime: runtime ?? this.runtime,
        sortBy: sortBy ?? this.sortBy,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory MoviesListModel.fromRawJson(String str) =>
      MoviesListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  MoviesListModel.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    backdropPath = json['backdrop_path'];

    if (json['results'] != null && json['results'] is List) {
      movies = <MovieModel>[];
      for (var v in (json['results'] as List)) {
        movies?.add(MovieModel.fromJson(v));
      }
    }

    user = json['created_by'] != null
        ? UserModel.fromJson(json['created_by'])
        : null;

    description = json['description'];
    id = json['id'];
    iso31661 = json['iso_3166_1'];
    iso6391 = json['iso_639_1'];
    itemCount = json['item_count'];
    name = json['name'];
    page = json['page'];
    posterPath = json['poster_path'];
    public = json['public'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    sortBy = json['sort_by'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (averageRating != null) data['average_rating'] = averageRating;
    if (backdropPath != null) data['backdrop_path'] = backdropPath;

    if (movies != null) {
      data['results'] = movies?.map((v) => v.toJson()).toList();
    }

    if (user != null) {
      data['created_by'] = user?.toJson();
    }

    if (description != null) data['description'] = description;
    if (id != null) data['id'] = id;
    if (iso31661 != null) data['iso_3166_1'] = iso31661;
    if (iso6391 != null) data['iso_639_1'] = iso6391;
    if (itemCount != null) data['item_count'] = itemCount;
    if (name != null) data['name'] = name;
    if (page != null) data['page'] = page;
    if (posterPath != null) data['poster_path'] = posterPath;
    if (public != null) data['public'] = public;
    if (revenue != null) data['revenue'] = revenue;
    if (runtime != null) data['runtime'] = runtime;
    if (sortBy != null) data['sort_by'] = sortBy;
    if (totalPages != null) data['total_pages'] = totalPages;
    if (totalResults != null) data['total_results'] = totalResults;

    return data;
  }
}

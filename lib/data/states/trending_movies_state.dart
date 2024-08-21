import '../models/movie_model.dart';

abstract class TrendingMoviesState {}

class TrendingMoviesInitialState extends TrendingMoviesState {}

class TrendingMoviesLoadingState extends TrendingMoviesState {}

class TrendingMoviesSuccessState extends TrendingMoviesState {
  final List<MovieModel> movies;

  TrendingMoviesSuccessState({required this.movies});
}

class TrendingMoviesErrorState extends TrendingMoviesState {
  final String message;

  TrendingMoviesErrorState({required this.message});
}

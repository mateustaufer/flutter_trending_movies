import '../models/movie_model.dart';

abstract class MovieState {}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieSuccessState extends MovieState {
  final List<MovieModel> movies;

  MovieSuccessState({required this.movies});
}

class MovieErrorState extends MovieState {
  final String message;

  MovieErrorState({required this.message});
}

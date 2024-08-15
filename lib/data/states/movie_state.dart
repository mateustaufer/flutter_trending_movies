import '../models/movie_model.dart';

abstract class MovieState {}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieSuccesState extends MovieState {
  final List<MovieModel> movies;

  MovieSuccesState({required this.movies});
}

class MovieErrorState extends MovieState {
  final String message;

  MovieErrorState({required this.message});
}

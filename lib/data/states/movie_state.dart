import '../models/movie_model.dart';

abstract class MovieState {}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieSuccessState extends MovieState {
  final MovieModel movie;

  MovieSuccessState({required this.movie});
}

class MovieErrorState extends MovieState {
  final String message;

  MovieErrorState({required this.message});
}

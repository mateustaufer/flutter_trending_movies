import 'package:flutter/material.dart';

import 'data/models/movies_list_model.dart';
import 'data/providers/movie_provider.dart';
import 'data/repositories/movie_repository.dart';
import 'widgets/base_page_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final moviesRepository = MovieRepository(MovieProvider());
  MoviesListModel moviesList = MoviesListModel();

  @override
  void initState() {
    super.initState();

    moviesRepository.fetchMoviesList(listId: 1).then((value) {
      setState(() {
        moviesList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(title: const Text('Movies List')),
      body: ListView.separated(
        itemCount: moviesList.movies?.length ?? 0,
        itemBuilder: (_, index) => ListTile(
            title: Text(moviesList.movies?[index].title ?? 'deu ruim')),
        separatorBuilder: (_, index) {
          if (index < (moviesList.movies?.length ?? 0)) {
            return const SizedBox(height: 8);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

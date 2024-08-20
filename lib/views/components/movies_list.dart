import 'package:flutter/material.dart';

import '../../data/models/movie_model.dart';

class MoviesList extends StatelessWidget {
  final List<MovieModel> movies;

  const MoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(movies[index].title ?? ''),
      ),
      separatorBuilder: (_, index) {
        if (index < (movies.length)) {
          return const SizedBox(height: 8);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

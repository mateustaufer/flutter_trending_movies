import 'package:flutter/material.dart';

import '../data/models/movies_list_model.dart';
import '../data/providers/movie_provider.dart';
import '../data/repositories/movie_repository.dart';
import '../widgets/base_page_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final moviesRepository = MovieRepository(MovieProvider());
  MoviesListModel moviesList = MoviesListModel();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    isLoading = true;

    // moviesRepository.fetchMoviesList(listId: 1).then((response) {
    //   response.fold(
    //     (l) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text(l.statusMessage ?? ''),
    //           showCloseIcon: true,
    //         ),
    //       );
    //     },
    //     (r) {
    //       setState(() {
    //         moviesList = r;
    //       });
    //     },
    //   );
    // }).whenComplete(() {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });

    moviesRepository
        .fetchTrendingMoviesList(timeWindow: 'day')
        .then((response) {
      response.fold(
        (l) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l.statusMessage ?? ''),
              showCloseIcon: true,
            ),
          );
        },
        (r) {
          setState(() {
            moviesList = r;
          });
        },
      );
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(title: const Text('Trending Movies')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : moviesList.movies?.isEmpty ?? true
              ? const Center(child: Text('A lista de filmes está vazia!'))
              : ListView.separated(
                  itemCount: moviesList.movies?.length ?? 0,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(moviesList.movies?[index].title ?? ''),
                  ),
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

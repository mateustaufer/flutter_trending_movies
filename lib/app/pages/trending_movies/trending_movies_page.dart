import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/states/trending_movies_state.dart';
import '../../data/stores/trending_movies_store.dart';
import '../../widgets/base_page_widget.dart';
import 'components/movies_list.dart';

class TrendingMoviesPage extends StatefulWidget {
  const TrendingMoviesPage({super.key});

  @override
  State<TrendingMoviesPage> createState() => _TrendingMoviesPageState();
}

class _TrendingMoviesPageState extends State<TrendingMoviesPage> {
  final trendingMoviesStore = GetIt.I.get<TrendingMoviesStore>();

  @override
  void initState() {
    super.initState();

    trendingMoviesStore.fetchTrendingMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 4,
        shadowColor: Colors.grey.shade400,
        title: const Text(
          'Trending Movies',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: trendingMoviesStore,
        builder: (context, state, child) {
          if (state is TrendingMoviesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TrendingMoviesErrorState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message), showCloseIcon: true),
              );
            });
          }

          if (state is TrendingMoviesSuccessState) {
            return MoviesList(movies: state.movies);
          }

          return const Center(child: Text('A lista de filmes está vazia!'));
        },
      ),
    );
  }
}

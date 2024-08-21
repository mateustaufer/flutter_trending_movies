import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/trending_movies_page_controller.dart';
import '../data/states/movie_state.dart';
import '../widgets/base_page_widget.dart';
import 'components/movies_list.dart';

class TrendingMoviesPageView extends StatefulWidget {
  const TrendingMoviesPageView({super.key});

  @override
  State<TrendingMoviesPageView> createState() => _TrendingMoviesPageState();
}

class _TrendingMoviesPageState extends State<TrendingMoviesPageView> {
  final controller = GetIt.I.get<TrendingMoviesPageController>();

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 4,
        shadowColor: Colors.grey.shade400,
        title: const Text(
          'Trending Movies',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.movieStore,
        builder: (context, state, child) {
          if (state is MovieLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MovieErrorState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message), showCloseIcon: true),
              );
            });
          }

          if (state is MovieSuccessState) {
            return MoviesList(movies: state.movies);
          }

          return const Center(child: Text('A lista de filmes está vazia!'));
        },
      ),
    );
  }
}

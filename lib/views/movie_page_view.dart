import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../data/states/movie_state.dart';
import '../data/stores/movie_store.dart';
import '../widgets/base_page_widget.dart';

class MoviePageView extends StatefulWidget {
  final String id;

  const MoviePageView({super.key, required this.id});

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  final movieStore = GetIt.I.get<MovieStore>();

  final isLoading = ValueNotifier<bool>(true);
  late final String title;

  @override
  void initState() {
    super.initState();

    movieStore.fetchMovieDetails(movieId: widget.id).whenComplete(() {
      if (movieStore.value is MovieSuccessState) {
        title = (movieStore.value as MovieSuccessState).movie.title ?? '';
      } else {
        title = 'Erro ao carregar o filme';
      }

      isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(
        title: ValueListenableBuilder(
            valueListenable: isLoading,
            builder: (context, value, child) {
              if (value) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade100,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 300,
                    height: 48,
                    color: Colors.white,
                  ),
                );
              }

              return Text(title);
            }),
      ),
      body: ValueListenableBuilder(
        valueListenable: movieStore,
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
            return Center(child: Text('Id do filme: ${state.movie.id}'));
          }

          return const Center(child: Text('A lista de filmes está vazia!'));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/states/movie_state.dart';
import '../../data/stores/movie_store.dart';
import '../../widgets/base_page_widget.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePage> {
  final movieStore = GetIt.I.get<MovieStore>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

      if (arguments?.containsKey('id') ?? false) {
        movieStore.fetchMovieDetails(movieId: arguments?['id'] ?? '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: ValueListenableBuilder(
          valueListenable: movieStore,
          builder: (context, state, child) {
            if (state is MovieInitialState) {
              return const Text('Carregando...');
            }

            if (state is MovieLoadingState) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.grey.shade300,
                child: Container(width: 300, height: 48, color: Colors.white),
              );
            }

            if (state is MovieSuccessState) {
              return Text((state.movie.title ?? ''));
            }

            return const Text(
              'Erro ao carregar o título do filme',
              style: TextStyle(color: Colors.white),
            );
          },
        ),
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
            return Center(
              child: Text(
                'Id do filme: ${state.movie.id}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          return const Center(
            child: Text(
              'A lista de filmes está vazia!',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

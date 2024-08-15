import 'package:flutter/material.dart';

import '../controllers/home_page_controller.dart';
import '../data/providers/movie_provider.dart';
import '../data/repositories/movie_repository.dart';
import '../data/states/movie_state.dart';
import '../widgets/base_page_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final controller = HomePageController(MovieRepository(MovieProvider()));

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(title: const Text('Trending Movies')),
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
            return ListView.separated(
              itemCount: state.movies.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(state.movies[index].title ?? ''),
              ),
              separatorBuilder: (_, index) {
                if (index < (state.movies.length)) {
                  return const SizedBox(height: 8);
                }

                return const SizedBox.shrink();
              },
            );
          }

          return const Center(child: Text('A lista de filmes está vazia!'));
        },
      ),
    );
  }
}

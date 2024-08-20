import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/home_page_controller.dart';
import '../data/states/movie_state.dart';
import '../widgets/base_page_widget.dart';
import 'components/movies_list.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  HomePageController controller = GetIt.I.get<HomePageController>();

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

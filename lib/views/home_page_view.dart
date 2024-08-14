import 'package:flutter/material.dart';

import '../controllers/home_page_controller.dart';
import '../data/models/movie_model.dart';
import '../widgets/base_page_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final controller = HomePageController();

  @override
  void initState() {
    super.initState();

    controller.fetchTrendingMovies(context);
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(title: const Text('Trending Movies')),
      body: ValueListenableBuilder<bool>(
        valueListenable: controller.isLoading,
        builder: (context, value, child) {
          return value
              ? const Center(child: CircularProgressIndicator())
              : child ?? const SizedBox.shrink();
        },
        child: ValueListenableBuilder<List<MovieModel>>(
          valueListenable: controller.movies,
          builder: (context, value, child) {
            return value.isEmpty
                ? const Center(child: Text('A lista de filmes está vazia!'))
                : ListView.separated(
                    itemCount: value.length,
                    itemBuilder: (_, index) => ListTile(
                      title: Text(value[index].title ?? ''),
                    ),
                    separatorBuilder: (_, index) {
                      if (index < (value.length)) {
                        return const SizedBox(height: 8);
                      }

                      return const SizedBox.shrink();
                    },
                  );
          },
        ),
      ),
    );
  }
}

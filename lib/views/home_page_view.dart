import 'package:flutter/material.dart';

import '../controllers/home_page_controller.dart';
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
              : controller.movies.value.isEmpty
                  ? const Center(child: Text('A lista de filmes está vazia!'))
                  : ListView.separated(
                      itemCount: controller.movies.value.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(controller.movies.value[index].title ?? ''),
                      ),
                      separatorBuilder: (_, index) {
                        if (index < (controller.movies.value.length)) {
                          return const SizedBox(height: 8);
                        }

                        return const SizedBox.shrink();
                      },
                    );
        },
      ),
    );
  }
}

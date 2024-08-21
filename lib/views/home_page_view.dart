import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/routes.dart';
import '../widgets/base_page_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton.icon(
              label: const Text('Trending Movies'),
              icon: const Icon(Icons.movie_creation_outlined),
              onPressed: () => context.goNamed(Routes.trendingMovies),
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              label: const Text('Flutter Counter'),
              icon: const Icon(Icons.add),
              onPressed: () => context.goNamed(Routes.counter),
            ),
          ],
        ),
      ),
    );
  }
}

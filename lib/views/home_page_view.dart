import 'package:flutter/material.dart';

import '../core/routes/routes.dart';
import '../widgets/base_page_widget.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

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
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.trendingMovies,
              ),
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              label: const Text('Flutter Counter'),
              icon: const Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(context, Routes.counter),
            ),
          ],
        ),
      ),
    );
  }
}

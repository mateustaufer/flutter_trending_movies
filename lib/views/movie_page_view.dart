import 'package:flutter/material.dart';

import '../widgets/base_page_widget.dart';

class MoviePageView extends StatefulWidget {
  const MoviePageView({super.key});

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: const Center(
        child: Text('Movie'),
      ),
    );
  }
}

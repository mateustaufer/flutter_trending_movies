import 'package:flutter/material.dart';

import '../widgets/base_page_widget.dart';

class MoviePageView extends StatefulWidget {
  final String id;

  const MoviePageView({super.key, required this.id});

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
      body: Center(
        child: Text('Movie ID: ${widget.id}'),
      ),
    );
  }
}

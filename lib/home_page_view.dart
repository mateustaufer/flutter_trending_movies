import 'package:flutter/material.dart';

import 'widgets/base_page_widget.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(title: const Text('Movies List')),
      body: ListView.separated(
        itemCount: 2,
        itemBuilder: (_, index) => ListTile(title: Text('$index')),
        separatorBuilder: (_, index) {
          if (index < 1) {
            return const SizedBox(height: 8);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

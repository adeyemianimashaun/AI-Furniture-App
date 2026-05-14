import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search furniture')),
          ],
        ),
      ),
    );
  }
}
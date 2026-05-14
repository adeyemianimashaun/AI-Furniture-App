import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offers')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(child: ListTile(title: Text('20% Off Living Room Sets'))),
          Card(child: ListTile(title: Text('Buy 1 Chair Get 1 Lamp'))),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:furniture/data/productdata.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sofa.length,
        itemBuilder: (context, index) {
          final item = sofa[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: ListTile(
              leading: Image.asset(item.image, width: 60),
              title: Text(item.name),
              subtitle: Text(item.price.toString()),
              trailing: const Icon(Icons.favorite, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
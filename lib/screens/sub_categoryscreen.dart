import 'package:flutter/material.dart';
//import 'package:furniture/data/categorygriddata.dart';
import 'package:furniture/data/productdata.dart';
import 'package:furniture/provider/favoriteprovider.dart';
import 'package:furniture/screens/productdetailsscreen.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class sub_CategoryScreen extends StatefulWidget {
  final String title;
 final String category;

  sub_CategoryScreen({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  State<sub_CategoryScreen> createState() => _sub_CategoryScreenState();
}

class _sub_CategoryScreenState extends State<sub_CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<Favprovider>(context);
    return Scaffold(
      backgroundColor:  Color(0xffF7F6F2),

      appBar: AppBar(
        backgroundColor:  Color(0xffF7F6F2),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style:  TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme:  IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Padding(
  padding: const EdgeInsets.all(16),
  child: StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: widget.category)
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.connectionState ==
          ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (!snapshot.hasData ||
          snapshot.data!.docs.isEmpty) {
        return const Center(
          child: Text("No products found"),
        );
      }

      final docs = snapshot.data!.docs;

      return ListView.builder(
        itemCount: docs.length,
        itemBuilder: (context, index) {
          final item = docs[index];

          final product = ProductModel(
  name: item['name'],
  image: item['image'],
  price: (item['price']).toDouble(),
  rating: item['rating'],
  description: item['description'],
  quantity: 1,
);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(
                    product: product,
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Image.asset(
  item['image'],
  width: 80,
  fit: BoxFit.cover,
),
              title: Text(item['name']),
              subtitle: Text(
                "\$${item['price']}",
              ),
              trailing: IconButton(
                onPressed: () {
                  prov.fav(product);
                },
                icon: Icon(
                  prov.isfav(product)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: prov.isfav(product)
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
          );
        },
      );
    },
  ),
)
    );
  }
}
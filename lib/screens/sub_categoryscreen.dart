import 'package:flutter/material.dart';
import 'package:furniture/data/categorygriddata.dart';
import 'package:furniture/data/productdata.dart';
import 'package:furniture/provider/favoriteprovider.dart';
import 'package:furniture/screens/productdetailsscreen.dart';
import 'package:provider/provider.dart';

class sub_CategoryScreen extends StatefulWidget {
  final String title;
  final List<Categoriesgrid> items;

  sub_CategoryScreen({
    super.key,
    required this.title,
    required this.items,
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
        padding:  EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final item = widget.items[index];

            return GestureDetector(

              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetailsPage(product: ProductModel(name: item.name, image: item.image, price: item.price, rating: item.rating, description: item.description,quantity: item.quantity)))),
              child: ListTile(
                leading: Image.asset(
                  item.image,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                title: Text(item.name),
                subtitle: Text("\$${item.price}"),
                trailing:  IconButton(onPressed: (){
                  prov.fav(
                    ProductModel(name: item.name, image: item.image, price: item.price, rating: item.rating, description: item.description,quantity: item.quantity)
                  );
                }, icon:Icon(
                      prov.isfav(ProductModel(name: item.name, image: item.image, price: item.price, rating: item.rating, description: item.description,quantity: item.quantity))
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: prov.isfav(ProductModel(name: item.name, image: item.image, price: item.price, rating: item.rating, description: item.description,quantity: item.quantity))
                          ? Colors.red
                          : Colors.grey,
                    ),
              ),
            )
            );
          },
        ),
      ),
    );
  }
}
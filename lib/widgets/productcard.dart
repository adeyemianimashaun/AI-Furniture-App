// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:furniture/data/productdata.dart';
import 'package:furniture/provider/favoriteprovider.dart';
import 'package:provider/provider.dart';

class Productcard extends StatelessWidget {
 final ProductModel product;
 final String image;
 final String title;
 final String price;
 final String rating;
 final String reviews;
  Productcard({
    Key? key,
    required this.product,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Favprovider>(context);
    return  Container(
    height: 320,
    width: 220,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          child: SizedBox(
            height: 150,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 10),

              Text(
                price,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),

                  SizedBox(width: 4),

                  Text(
                    "$rating ($reviews)",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),

                  Spacer(),

                  IconButton(
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
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
  }
}

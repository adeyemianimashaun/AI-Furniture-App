import 'package:flutter/material.dart';
import 'package:furniture/data/catitems.dart';
import 'package:furniture/data/productdata.dart';
import 'package:furniture/provider/cartprovider.dart';

import 'package:furniture/screens/cartscreen.dart';
import 'package:furniture/screens/categoriesscreen.dart';
import 'package:furniture/screens/productdetailsscreen.dart';

import 'package:furniture/widgets/bestselling.dart';
import 'package:furniture/widgets/catwidget.dart';
import 'package:furniture/widgets/productcard.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<Cartprovider>(context);
    return Scaffold(
      backgroundColor: Color(0xffF7F6F2),
      body: SafeArea(
        child: IndexedStack(
          children:[
            SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TOP BAR
                  Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 28,
                      ),
              
                      Spacer(),
              
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CartScreen(
                              
          
                            ))),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              size: 28,
                            ),
                          ),
              
                          Positioned(
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color(0xffFBC02D),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                prov.Bnner().toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
              
                  SizedBox(height: 24),
              
                  /// GREETING
                  Text(
                    'Hello, Deyemi 👋',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              
                  SizedBox(height: 8),
              
                  Text(
                    'Find the best furniture for your home',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
              
                  SizedBox(height: 20),
              
                  /// SEARCH BAR
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search furniture...',
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
              
                      SizedBox(width: 12),
              
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xffFBC02D),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(Icons.tune),
                      )
                    ],
                  ),
              
                  SizedBox(height: 20),
              
                  /// BANNER
                  Container(
                    height: 170,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff2E7D32),
                          Color(0xff4CAF50),
                        ],
                        
                      ),
                      image: DecorationImage(image: AssetImage('lib/images/banner.jpg',),fit: BoxFit.cover)
                      ),
                    
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Summer Sale\nUp to 40% Off',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height:5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffFBC02D),
                          ),
                          child: TextButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesPage()));
                          }, child:Text(
                            'Shop now',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:5),
              
                  //CATEGORIES AND VIEWALL ROWS
              
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){}, child: Text('Categories',
                      style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),)),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesPage()));
                      }, child: Text('viewall',
                      style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff4CAF50),
                            fontWeight: FontWeight.bold,
                          ),)),
                    ],
                  ),
                  SizedBox(height:3),
                  //LISTVIEW FOR CATEGORIES
                  SizedBox(
                    height:120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:categoryitems.length,
                      itemBuilder: (context,index){
                        final catitem=categoryitems[index];
                        return Padding(
                          padding: const EdgeInsets.only(right:9),
                          child: categoryItem(image: catitem.image, title: catitem.name),
                        );
                      }),
                  ),
              
                  //BESTSELLING AND VIEWALL
              
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){}, child: Text('Bestselling',
                      style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),)),
                      TextButton(onPressed: (){}, child: Text('viewall',
                      style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff4CAF50),
                            fontWeight: FontWeight.bold,
                          ),)),
                    ],
                  ),
                  //LISTVIEW FOR PRODUCTS
                  SizedBox(
                    height:340,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:bestsellers.length,
                      itemBuilder: (context,index){
                        final bestseller=bestsellers[index];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetailsPage(
            product: ProductModel(
              name: bestseller.name,
              image: bestseller.image,
              price: bestseller.price,
              rating: bestseller.rating,
              description: bestseller.description,
              quantity: 1,
            ),
                          )));},
                            
                            
                            child: Productcard(image: bestseller.image, title: bestseller.name, price: bestseller.price.toString(), 
                            rating: bestseller.rating, reviews: bestseller.reviews,product:  ProductModel(
              name: bestseller.name,
              image: bestseller.image,
              price: bestseller.price,
              rating: bestseller.rating,
              description: bestseller.description,
              quantity: 1,
            ))),
                        );
                      }),
                  ),
              
              
              
              
              
              
              
              
              
              
              
              
                  //END OF APP
                ],
              ),
            ),
          ),
          ], 
        ),
      ),
    );
  }
}
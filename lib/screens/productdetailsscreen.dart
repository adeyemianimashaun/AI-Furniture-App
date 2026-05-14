// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:furniture/data/productdata.dart';
import 'package:furniture/provider/cartprovider.dart';
import 'package:furniture/provider/favoriteprovider.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {

  final ProductModel product;

  ProductDetailsPage({
    Key? key,

    required this.product
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  int selectedColorIndex = 0;

  final List<Color> colors = [
    Color(0xff2E5D3D), // green
    Color(0xffFBC02D), // yellow
    Color(0xffD9D6CF), // grey
  ];

  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<Cartprovider>(context);
    final fprov=Provider.of<Favprovider>(context);
    return Scaffold(
      backgroundColor: Color(0xffF7F6F2),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          child: Column(
            children: [
              /// TOP BAR
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),),
                  ),

                  Row(
                    children: [
                      IconButton(onPressed: (){
                        fprov.fav(widget.product);
                      }, icon:  Icon(
    fprov.isfav(widget.product)
        ? Icons.favorite
        : Icons.favorite_border,
    color: fprov.isfav(widget.product)
        ? Colors.red
        : Colors.grey,
    size: 26,
  ),
),
                      
                      SizedBox(width: 18),
                      Icon(
                        Icons.share_outlined,
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 8),

              /// PRODUCT IMAGE SECTION
              Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    /// MAIN IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.asset(
                        widget.product.image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// DISCOUNT BADGE
                    Positioned(
                      top: 18,
                      left: 18,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffFBC02D),
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                        child: Text(
                          "-20%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    /// IMAGE COUNT
                    Positioned(
                      bottom: 18,
                      right: 18,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                        child: Text(
                          "1/5",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    /// DOT INDICATOR
                    Positioned(
                      bottom: 22,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: index == 0
                                  ? Colors.white
                                  : Colors.white54,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              /// DETAILS SECTION
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        //PRODUCTNAME
                        Text(
                          widget.product.name,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff123524),
                          ),
                        ),
                        Icon(
                          Icons.compare_arrows,
                          size: 24,
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        //PRODUCT PRICE
                        Text(
                          widget.product.price.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "\$689.00",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            decoration:
                                TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 14),

                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFBC02D),
                          size: 20,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "4.6 (128 reviews)",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 22),

                    Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 14),

                    /// COLOR OPTIONS
                    Row(
                      children: List.generate(
                        colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = index;
                            });
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(right: 14),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedColorIndex ==
                                        index
                                    ? Color(0xffFBC02D)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: colors[index],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 26),

                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 10),
                    //PRODUCT DESCRIPTION

                    Text(
                      "A perfect blend of style and comfort. Made with premium fabric and solid wood frame.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.6,
                      ),
                    ),

                    Spacer(),

                    /// BOTTOM ACTIONS
                    Row(
                      children: [
                        /// QUANTITY BUTTON
                        Container(
  width: 150,
  height: 56,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      /// MINUS
      IconButton(
        onPressed: () {
          // if (quantity > 1)
          {
            setState(() {
              prov.remove_quantity(widget.product);
            });
          }
        },
        icon: Text(
          "-",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      /// QUANTITY
      Text(
        widget.product.quantity.toString(),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      /// PLUS
      IconButton(
        onPressed: () {
          setState(() {
            prov.add_quantity(widget.product);
          });
        },
        icon: Text(
          "+",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
),

                        SizedBox(width: 16),

                        /// ADD TO CART BUTTON
                        Expanded(
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xffFBC02D),
                              borderRadius:
                                  BorderRadius.circular(18),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                ),
                                SizedBox(width: 10),
                                TextButton(onPressed: (){
                                  prov.add_cart(widget.product);
                                }, child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
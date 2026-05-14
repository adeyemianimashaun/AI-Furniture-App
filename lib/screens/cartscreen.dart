
import 'package:flutter/material.dart';
//import 'package:furniture/data/productdata.dart';
import 'package:furniture/provider/cartprovider.dart';
import 'package:furniture/screens/checkoutpage.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  // final ProductModel product;
  CartScreen({
    Key? key,
    // required this.product,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final prov=Provider.of<Cartprovider>(context);


    return Scaffold(
      backgroundColor:  Color(0xffF7F6F2),

      appBar: AppBar(
        backgroundColor:  Color(0xffF7F6F2),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            /// CART ITEMS
            SizedBox(
              height: 600,
              child:prov.cart.isEmpty? Text('No item(s) in cart. \nKindly add items to your cart',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey
              ),):
              ListView.builder(
                itemCount: prov.cart.length,
                itemBuilder: (context, index) {
                  final cartitem = prov.cart[index];
              
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        /// PRODUCT IMAGE
                        Container(
                          width: 105,
                          height: 105,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              cartitem.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
              
                        SizedBox(width: 14),
              
                        /// PRODUCT DETAILS
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartitem.name,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
              
                              SizedBox(height: 8),
              
                              Text(
                                "\$${cartitem.price}",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
              
                              SizedBox(height: 12),
              
                              Row(
                                children: [
                                  /// MINUS
                                  Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                    child: GestureDetector(
                                      onTap:()=> prov.remove_quantity(cartitem),
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                      ),
                                    ),
                                  ),
              
                                  SizedBox(width: 10),
              
                                  Text(
                                    "${cartitem.quantity}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
              
                                  SizedBox(width: 10),
              
                                  /// PLUS
                                  Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                    child: GestureDetector(
                                      onTap:()=> prov.add_quantity(cartitem),
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
              
                        /// DELETE ICON
                        GestureDetector(
                          onTap:()=> prov.remove_cart(cartitem),
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// PROMO CODE
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Promo Code",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12),

                Container(
                  height: 56,
                  width: 100,
                  decoration: BoxDecoration(
                    color:  Color(0xff1B5E20),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child:  Center(
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            /// TOTAL
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total (${prov.Bnner()} items)",
                  style:  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Text(
                  "\$${prov.Total().toStringAsFixed(2)}",
                  style:  TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            /// CHECKOUT BUTTON
            Container(
              height: 62,
              width: double.infinity,
              decoration: BoxDecoration(
                color:  Color(0xffFBC02D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CheckoutScreen()));
                  }, child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),),

                  

                  Container(
                    margin:  EdgeInsets.only(right: 10),
                    width: 44,
                    height: 44,
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child:  Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:furniture/data/productdata.dart';
import 'package:furniture/provider/favoriteprovider.dart';
import 'package:furniture/screens/productdetailsscreen.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  
  Favorites({super.key});

  // final List< List<ProductModel>> items = [
  //   sofa,
  //   chair,
  //   table,
  //   bed,
  //   lamp
  // ];
    

  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<Favprovider>(context);
    return Scaffold(
      backgroundColor: Color(0xffF7F6F2),

      appBar: AppBar(
        backgroundColor: Color(0xffF7F6F2),
        elevation: 0,
        centerTitle: true,

        //ARROW BACK BUTTON
        leading: IconButton(
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
        title: Text(
          "My Wishlist",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:prov.favorites.isEmpty? Center(child: Text('There are no favorite items to display. ',
        style: TextStyle(
          fontSize: 22,
          color: Colors.grey
        ),)):
        ListView.builder(
          itemCount: prov.favorites.length,
          itemBuilder: (context, index) {
            final item = prov.favorites[index];

            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetailsPage(product: item))),
              child: Padding(
                padding: EdgeInsets.only(bottom: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// PRODUCT IMAGE
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(item.image
                          ,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              
                    SizedBox(width: 14),
              
                    /// PRODUCT DETAILS
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 6),
              
                          Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
              
                          SizedBox(height: 8),
              
                          Text(
                            item.price.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
              
                          SizedBox(height: 8),
              
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xffFBC02D),
                                size: 18,
                              ),
              
                              SizedBox(width: 4),
              
                              Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                    /// FAVORITE ICON
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: IconButton(onPressed: (){
                        prov.fav(item);
                      }, icon: Icon(
                        Icons.favorite,
                        color: Color(0xffFBC02D),
                        size: 28,
                      ),),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
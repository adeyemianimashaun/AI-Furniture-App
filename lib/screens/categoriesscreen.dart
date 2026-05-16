import 'package:flutter/material.dart';
import 'package:furniture/data/catitems.dart';
import 'package:furniture/screens/sub_categoryscreen.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
   final List<String> categories = [
  "sofa",
  "chair",
  "table",
  "bed",
  "lamp",
];

    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: categoryitems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final catitem = categoryitems[index];
          final categoryName = categories[index];

          return GestureDetector(

            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>sub_CategoryScreen(
  title: catitem.name,
  category: categoryName,
))),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  /// IMAGE
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      catitem.image,
                      fit: BoxFit.cover,
                    ),
                  ),
            
                  /// BOTTOM INFO CONTAINER
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      color: Colors.white.withOpacity(0.9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            catitem.name,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                          "ViewProducts",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
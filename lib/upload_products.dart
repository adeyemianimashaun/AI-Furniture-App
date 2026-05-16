// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:furniture/data/productdata.dart';

// Future<void> uploadAllProducts() async {
//   final firestore = FirebaseFirestore.instance;

//   Future<void> uploadCategory(
//     List<ProductModel> products,
//     String category,
//   ) async {
//     for (var product in products) {
//       await firestore.collection('products').add({
//         'name': product.name,
//         'image': product.image,
//         'price': product.price,
//         'rating': product.rating,
//         'description': product.description,
//         'quantity': product.quantity,
//         'category': category,
//       });
//     }
//   }

//   await uploadCategory(sofa, 'sofa');
//   await uploadCategory(chair, 'chair');
//   await uploadCategory(table, 'table');
//   await uploadCategory(bed, 'bed');
//   await uploadCategory(lamp, 'lamp');

//   print("All products uploaded successfully!");
// }
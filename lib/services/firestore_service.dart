import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  Stream<QuerySnapshot> getProducts() {
  return firestore
      .collection('products')
      .limit(6)
      .snapshots();
}
}
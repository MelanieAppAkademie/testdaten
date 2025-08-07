import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testdaten/src/domain/product.dart';

class FirestoreRepo {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    final docRef = _firestore.collection('products');
    await docRef.add(product.toMap());
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testdaten/src/domain/product.dart';

class FirestoreRepo {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    final docRef = _firestore.collection('products');
    try {
      await docRef.add(product.toMap());
    } catch (e) {
      print('Failed to add product: $e');
      rethrow;
    }
  }

  Future<List<Product>> getAllProducts() async {
    try {
      // Get the snapshot of the entire 'products' collection.
      final snapshot = await _firestore.collection('products').get();

      // Check if the snapshot is empty.
      if (snapshot.docs.isEmpty) {
        return [];
      }

      // Map each document in the snapshot to a Product object.
      // We use the fromMap factory constructor and pass the document's ID
      // and data.
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data());
      }).toList();
    } catch (e) {
      print('Failed to get products: $e');
      rethrow;
    }
  }
}

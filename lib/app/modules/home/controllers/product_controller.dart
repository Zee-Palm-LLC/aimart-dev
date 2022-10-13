import 'package:aimart_dev/app/services/database_services.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductController extends GetxController {
  DatabaseService db = DatabaseService();
  Rx<List<Product>?> products = Rx<List<Product>?>(null);
  List<Product>? get allproductList => products.value;

  Stream<List<Product>> getAllProducts() {
    return db.productsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Stream<List<Product>> getDiscountedItems() {
    return db.productsCollection
        .where('productTag', isEqualTo: 2)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  @override
  void onInit() {
    super.onInit();
    products.bindStream(getAllProducts());
  }
}

//
        
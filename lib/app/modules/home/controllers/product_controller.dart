import 'package:aimart_dev/app/services/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';
import 'auth_controller.dart';

class ProductController extends GetxController {
  DatabaseService db = DatabaseService();
  FirebaseAuth user = FirebaseAuth.instance;
  Rx<List<Product>?> products = Rx<List<Product>?>(null);
  List<Product>? get allproductList => products.value;
  //Favourites
  Rx<List<String>?> _savedProductsIds = Rx<List<String>?>([]);
  List<String>? get savedProductsIds => _savedProductsIds.value;
  Rx<List<Product>?> _savedProducts = Rx<List<Product>?>([]);
  List<Product> get savedProducts => _savedProducts.value ?? [];

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

  Stream<List<String>?> getFavoriteItem() {
    return db.usersCollection
        .doc(user.currentUser!.uid)
        .collection('favorites')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => e.id).toList();
    });
  }

  Future<void> addToFavourite({required Product product}) async {
    try {
      await db.usersCollection
          .doc(user.currentUser!.uid)
          .collection('favorites')
          .doc(product.productId)
          .set(product.toMap())
          .then((value) => print("Added"));
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> deletefromFavourite({required Product product}) async {
    try {
      await db.usersCollection
          .doc(user.currentUser!.uid)
          .collection('favorites')
          .doc(product.productId)
          .delete()
          .then((value) => print('Deleted'));
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Stream<List<Product>> getFavoriteProducts() {
    return db.usersCollection
        .doc(user.currentUser!.uid)
        .collection('favorites')
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
    _savedProductsIds.bindStream(getFavoriteItem());
    _savedProducts.bindStream(getFavoriteProducts());
  }
}
//
        
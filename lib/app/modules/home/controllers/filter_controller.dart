import 'package:get/get.dart';

import '../../../data/helper/product_category.dart';
import '../../../services/database_services.dart';
import '../models/product_model.dart';

class FilterController extends GetxController {
  DatabaseService db = DatabaseService();
   Rx<List<Product>?> filterProducts = Rx<List<Product>?>(null);
  List<Product>? get allproductList => filterProducts.value;



  Future<List<Product>?> getFilterProducts(
      {required ProductCategory category,
      required String color,
      required int price,
      required String sizes}) async {
    try {
      List<Product>? products = [];

      var docs = await db.productsCollection
          .where('productCategory', isEqualTo: category.index)
          .where('colors', arrayContains: color)
          .where('productPrice', isEqualTo: price)
          // .where('sizes', arrayContains: sizes)
          .get();
      for (var product in docs.docs) {
        products.add(Product.fromMap(product.data() as Map<String, dynamic>));
      }
      return products;
    } on Exception catch (err) {
      print(err);
    }
  }
  
}

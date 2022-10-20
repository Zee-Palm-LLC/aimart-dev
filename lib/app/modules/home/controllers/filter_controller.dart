import 'package:aimart_dev/app/modules/home/controllers/product_controller.dart';
import 'package:get/get.dart';

import '../../../data/helper/product_category.dart';
import '../../../services/database_services.dart';
import '../models/product_model.dart';

class FilterController extends GetxController {
  DatabaseService db = DatabaseService();
  Rx<ProductCategory> _selectedCategory = ProductCategory.all.obs;
  ProductCategory get selectedCategory => _selectedCategory.value;
  Rx<ProductCategory> _selectedCategory = ProductCategory.all.obs;
  ProductCategory get selectedCategory => _selectedCategory.value;

  Future<List<Product>?> getFilterProducts(
      {required ProductCategory category,
      required String color,
      required int price,
      required String sizes}) async {
    try {
      var docs = await db.productsCollection
          .where('productCategory', isEqualTo: _selectedCategory)
          .where('colors', arrayContains: color)
          .where('productPrice', isEqualTo: price)
          // .where('sizes', arrayContains: sizes)
          .get();
      for (var product in docs.docs) {
        filterProducts
            .add(Product.fromMap(product.data() as Map<String, dynamic>));
      }
      return filterProducts;
    } on Exception catch (err) {
      print(err);
    }
  }
}

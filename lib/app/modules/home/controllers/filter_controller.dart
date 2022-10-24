import 'package:get/get.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

import '../../../data/helper/product_category.dart';
import '../../../services/database_services.dart';
import '../models/product_model.dart';

class FilterController extends GetxController {
  DatabaseService db = DatabaseService();
  Rx<List<Product>?> filterProducts = Rx<List<Product>?>(null);
  List<Product>? get allproductList => filterProducts.value;
  Rx<Product?> _searchItems = Rx<Product?>(null);
  Product? get searchItems => _searchItems.value;
  set setSearchItem(Product product) => _searchItems.value = product;
  RxBool _searching = false.obs;
  bool get searching => _searching.value;
  set setSearch(bool value) => _searching.value = value;
  RxBool _isFilter = false.obs;
  bool get isFilter => _isFilter.value;
  set setFilter(bool value) => _isFilter.value = value;
  Future<List<Product>?> getFilterProducts(
      {required ProductCategory category,
      required String color,
      required int price,
      required String sizes}) async {
    try {
      List<Product>? products = [];
      print("price $price");
      print("category  ${category.toString()}");
      var docs = category.index == 0
          ? await db.productsCollection
              // .where('productCategory', isEqualTo: category.index)
              .where('colors', isEqualTo: color)
              .where('productPrice', isLessThan: price)
              // .where('sizes', arrayContains: sizes)
              .get()
          : await db.productsCollection
              .where('productCategory', isEqualTo: category.index)
              .where('colors', arrayContains: color)
              .where('productPrice', isLessThan: price)
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

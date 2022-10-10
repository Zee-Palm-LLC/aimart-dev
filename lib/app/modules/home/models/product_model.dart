import 'package:aimart_dev/app/modules/home/models/product_tag.dart';

import '../../../data/constants/constants.dart';
import '../../../data/helper/product_category.dart';

class Product {
  String? productId;
  String? productName;
  double? productPrize;
  String? productImage;
  String? productType;
  ProductCategory? productCategory;
  ProductTag? productTag;
  String? oldPrize;
  Product(
      {this.productId,
      this.productName,
      this.productPrize,
      this.productImage,
      this.productType,
      this.oldPrize,
      this.productTag,
      this.productCategory});
}

List<Product> products = [
  product1,
  product2,
  product3,
  product4,
  product5,
  product1,
  product2,
  product3
];

Product product1 = Product(
  productImage: CustomAssets.kproduct1,
  productName: 'Black Maria Sytle',
  productType: "Shirt & Hats",
  productPrize: 49.99,
  productTag: ProductTag(tagName: "Trending", tagType: Tagtype.trending),
  productCategory: ProductCategory.women,
  oldPrize: '53.00',
);
Product product2 = Product(
  productImage: CustomAssets.kproduct2,
  productName: 'Fendi Rom Sytle',
  productType: "Sweater & Bag",
  productPrize: 69.99,
  productTag: ProductTag(tagName: "Best Seller", tagType: Tagtype.bestseller),
  productCategory: ProductCategory.women,
  oldPrize: '53.00',
);
Product product3 = Product(
  productImage: CustomAssets.kproduct3,
  productName: 'Heater Ford Style',
  productType: "Shirt & Hats",
  productPrize: 57.99,
  productTag: ProductTag(tagName: "-50 %", tagType: Tagtype.discount),
  productCategory: ProductCategory.men,
  oldPrize: '144.00',
);
Product product4 = Product(
  productImage: CustomAssets.kproduct4,
  productName: 'Heater Ford Style',
  productType: "Shirt & Hats",
  productPrize: 59.99,
  productTag: ProductTag(tagName: "-50 %", tagType: Tagtype.discount),
  productCategory: ProductCategory.men,
  oldPrize: '120.00',
);
Product product5 = Product(
  productImage: CustomAssets.kproduct1,
  productName: 'Blazzer Casual',
  productType: "Shirt & Hats",
  productPrize: 37.99,
  productTag: ProductTag(tagName: "-50 %", tagType: Tagtype.discount),
  productCategory: ProductCategory.men,
  oldPrize: '73.00',
);

List<Product> displayproduct = [product10, product12];
Product product10 = Product(
  productImage: CustomAssets.kkarli,
  productName: 'Black Maria Sytle',
  productType: "Shirt & Hats",
  productPrize: 49.99,
  productTag: ProductTag(tagName: "Trending", tagType: Tagtype.trending),
  productCategory: ProductCategory.women,
  oldPrize: '53.00',
);

Product product12 = Product(
  productImage: CustomAssets.product2,
  productName: 'Fendi Rom Sytle',
  productType: "Sweater & Bag",
  productPrize: 69.99,
  productTag: ProductTag(tagName: "Best Seller", tagType: Tagtype.bestseller),
  productCategory: ProductCategory.women,
  oldPrize: '53.00',
);

Product product13 = Product(
  productImage: CustomAssets.kheaterfortstyle,
  productName: 'Heater Ford Style',
  productType: "Shirt & Hats",
  productPrize: 57.99,
  productTag: ProductTag(tagName: "-50 %", tagType: Tagtype.discount),
  productCategory: ProductCategory.men,
  oldPrize: '144.00',
);

Product product14 = Product(
  productImage: CustomAssets.kheaterfortstyle,
  productName: 'Heater Ford Style',
  productType: "Shirt & Hats",
  productPrize: 59.99,
  productTag: ProductTag(tagName: "-50 %", tagType: Tagtype.discount),
  productCategory: ProductCategory.men,
  oldPrize: '120.00',
);

Product product15 = Product(
  productImage: CustomAssets.product3,
  productName: 'Blazzer Casual',
  productType: "Shirt & Hats",
  productPrize: 37.99,
  productTag: ProductTag(tagName: "-50 %", tagType: Tagtype.discount),
  productCategory: ProductCategory.men,
  oldPrize: '73.00',
);

import 'dart:convert';

import 'package:algolia/algolia.dart';

import '../../../data/helper/product_category.dart';
import 'rating_model.dart';

class Product {
  String productId;
  String productName;
  String productType;
  int productPrice;
  int? oldPrice;
  List<String> productImages;
  ProductCategory productCategory;
  Tagtype productTag;
  String description;
  List<String> colors;
  List<String> sizes;
  Rating? rating;
  Product({
    required this.productId,
    required this.productName,
    required this.productType,
    required this.productPrice,
    this.oldPrice,
    required this.productCategory,
    required this.productImages,
    required this.productTag,
    required this.description,
    required this.colors,
    required this.sizes,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'productType': productType,
      'productPrice': productPrice,
      'oldPrice': oldPrice,
      'productImages': productImages,
      'productTag': productTag.index,
      'description': description,
      'colors': colors,
      'sizes': sizes,
      'rating': rating?.toMap(),
      'productCategory': productCategory.index
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] as String,
      productName: map['productName'] as String,
      productType: map['productType'] as String,
      productPrice: map['productPrice'] as int,
      oldPrice: map['oldPrice'] != null ? map['oldPrice'] as int : null,
      productImages: List<String>.from((map['productImages'] as List<dynamic>)),
      productTag: Tagtype.values[map['productTag']],
      productCategory: ProductCategory.values[map['productCategory']],
      description: map['description'] as String,
      colors: List<String>.from((map['colors'] as List<dynamic>)),
      sizes: List<String>.from((map['sizes'] as List<dynamic>)),
      rating: map['rating'] != null
          ? Rating.fromMap(map['rating'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Product.fromAlgolia(AlgoliaObjectSnapshot snapshot) {
    return Product(
        productId: snapshot.data['productId'],
        productName: snapshot.data['productName'],
        productType: snapshot.data['productType'],
        productPrice: snapshot.data['productPrice'],
        productCategory:
            ProductCategory.values[snapshot.data['productCategory']],
        productImages: List<String>.from(
            (snapshot.data['productImages'] as List<dynamic>)),
        productTag: Tagtype.values[snapshot.data['productTag']],
        description: snapshot.data['description'],
        colors: List<String>.from((snapshot.data['colors'] as List<dynamic>)),
        sizes: List<String>.from((snapshot.data['sizes'] as List<dynamic>)),
        oldPrice: snapshot.data['oldPrice'],
        rating: snapshot.data['rating']);
  }
}

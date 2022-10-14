import 'dart:convert';

import 'package:aimart_dev/app/modules/home/models/product_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItemModel {
  Product product;
  int quantity;
  CartItemModel({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'product': product.toMap()});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      product: Product.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source));
}

class CartModel {
  List<CartItemModel> cartItemModel;
  CartModel({
    required this.cartItemModel,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'cartItemModel': cartItemModel.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      cartItemModel: List<CartItemModel>.from(map['cartItemModel']?.map((x) => CartItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source));
}

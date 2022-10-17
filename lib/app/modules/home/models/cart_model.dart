import 'dart:convert';

import 'package:aimart_dev/app/modules/home/models/product_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItemModel {
  Product product;
  int quantity;
  // String productId;// dubara q li hwi jb pura product para hwa
  CartItemModel({
    required this.product,
    required this.quantity,
    // required this.productId,
  });
//cart khali kro database mese
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
      // 'productId': productId,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      product: Product.fromMap(map['product']),
      quantity: map['quantity'],
      // productId: map['productId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CartModel {
  List<CartItemModel> cartItemModel;

  CartModel({
    required this.cartItemModel,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll(
        {'cartItemModel': cartItemModel.map((x) => x.toMap()).toList()});

    return result;
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      cartItemModel: List<CartItemModel>.from(
          map['cartItemModel']?.map((x) => CartItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));
}

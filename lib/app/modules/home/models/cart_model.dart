import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItemModel {
  String id;
  String productImage;
  String productName;
  int quantity;
  double cost;
  double totalPrice;
  CartItemModel({
    required this.id,
    required this.productImage,
    required this.productName,
    required this.quantity,
    required this.cost,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productImage': productImage,
      'productName': productName,
      'quantity': quantity,
      'cost': cost,
      'totalPrice': totalPrice,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as String,
      productImage: map['productImage'] as String,
      productName: map['productName'] as String,
      quantity: map['quantity'] as int,
      cost: map['cost'] as double,
      totalPrice: map['totalPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

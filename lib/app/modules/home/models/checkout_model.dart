// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aimart_dev/app/data/helper/checkout_enum.dart';
import 'package:aimart_dev/app/modules/home/models/cart_model.dart';
import 'package:aimart_dev/app/modules/home/models/product_model.dart';

class CheckoutModel {
  String checkoutId;
  List<CartItemModel> products;
  Checkout paymentMethod;
  String fullName;
  String cardNumber;
  String expireDate;
  String securityCode;
  String phoneNumber;
  String city;
  String region;
  String postalCode;
  String country;
  CheckoutModel({
    required this.checkoutId,
    required this.products,
    required this.paymentMethod,
    required this.fullName,
    required this.cardNumber,
    required this.expireDate,
    required this.securityCode,
    required this.phoneNumber,
    required this.city,
    required this.region,
    required this.postalCode,
    required this.country,
  });
  int get totalAmount {
    int amount = 0;
    for (var element in products) {
      int productTotalPrice = element.product.productPrice *
          element.quantity; // price could be double...
      amount += productTotalPrice;
    }
    return amount;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'checkoutId': checkoutId,
      'products': products.map((x) => x.toMap()).toList(),
      'paymentMethod': paymentMethod.index,
      'fullName': fullName,
      'cardNumber': cardNumber,
      'expireDate': expireDate,
      'securityCode': securityCode,
      'phoneNumber': phoneNumber,
      'city': city,
      'region': region,
      'postalCode': postalCode,
      'country': country,
    };
  }

  factory CheckoutModel.fromMap(Map<String, dynamic> map) {
    return CheckoutModel(
      checkoutId: map['checkoutId'] as String,
      products: List<CartItemModel>.from(
        (map['products'] as List<int>).map<CartItemModel>(
          (x) => CartItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      paymentMethod: Checkout.values[map['paymentMethod']],
      fullName: map['fullName'] as String,
      cardNumber: map['cardNumber'] as String,
      expireDate: map['expireDate'] as String,
      securityCode: map['securityCode'] as String,
      phoneNumber: map['phoneNumber'] as String,
      city: map['city'] as String,
      region: map['region'] as String,
      postalCode: map['postalCode'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckoutModel.fromJson(String source) =>
      CheckoutModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aimart_dev/app/data/helper/order_status.dart';
import 'package:aimart_dev/app/modules/home/models/product_model.dart';

class HistoryModel {
  String orderId;
  Product product;
  OrderStatus orderStatus;

  HistoryModel({
    required this.orderId,
    required this.product,
    required this.orderStatus,
  });
}

List<HistoryModel> historyList = [
  HistoryModel(
      orderId: '#0D357S', product: product1, orderStatus: OrderStatus.pending),
  HistoryModel(
      orderId: '#1R4V54S',
      product: product1,
      orderStatus: OrderStatus.delivery),
  HistoryModel(
      orderId: '#1R4V54S', product: product2, orderStatus: OrderStatus.waiting),
  HistoryModel(
      orderId: '#1R4V54S', product: product3, orderStatus: OrderStatus.cancel),
  HistoryModel(
      orderId: '#1R4V54S',
      product: product3,
      orderStatus: OrderStatus.delivery),
  HistoryModel(
      orderId: '#1R4V54S', product: product4, orderStatus: OrderStatus.process),
  HistoryModel(
      orderId: '#1R4V54S',
      product: product5,
      orderStatus: OrderStatus.received),
  HistoryModel(
      orderId: '#1R4V54S', product: product1, orderStatus: OrderStatus.process),
  HistoryModel(
      orderId: '#1R4V54S', product: product2, orderStatus: OrderStatus.waiting),
];

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  String transactionId;
  String senderId;
  String receiverId;
  String receiverName;
  DateTime transactionTime;
  double amountSent;
  TransactionModel({
    required this.transactionId,
    required this.senderId,
    required this.receiverId,
    required this.receiverName,
    required this.transactionTime,
    required this.amountSent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionId': transactionId,
      'senderId': senderId,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'transactionTime': transactionTime.millisecondsSinceEpoch,
      'amountSent': amountSent,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      transactionId: map['transactionId'] as String,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      receiverName: map['receiverName'] as String,
      transactionTime:
          DateTime.fromMillisecondsSinceEpoch(map['transactionTime'] as int),
      amountSent: map['amountSent'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<TransactionModel> dummyTransactions = [
  TransactionModel(
      transactionId: '1',
      senderId: '1',
      receiverId: '1',
      receiverName: 'Blazzer Fit Black Man',
      transactionTime: DateTime.now(),
      amountSent: 89.99),
  TransactionModel(
      transactionId: '2',
      senderId: '2',
      receiverId: '2',
      receiverName: 'Lindberg Polo Golf',
      transactionTime: DateTime.now(),
      amountSent: 29.99),
  TransactionModel(
      transactionId: '3',
      senderId: '3',
      receiverId: '3',
      receiverName: 'Cashback Extra 07:07',
      transactionTime: DateTime.now(),
      amountSent: 39.99),
];

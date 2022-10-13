import 'dart:convert';

class Rating {
  String senderImage;
  String senderName;
  double totalRating;
  int reviewCount;
  double averageRating;
  Rating({
    required this.senderImage,
    required this.senderName,
    required this.totalRating,
    required this.reviewCount,
    required this.averageRating,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'senderImage': senderImage});
    result.addAll({'senderName': senderName});
    result.addAll({'totalRating': totalRating});
    result.addAll({'reviewCount': reviewCount});
    result.addAll({'averageRating': averageRating});

    return result;
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      senderImage: map['senderImage'] ?? '',
      senderName: map['senderName'] ?? '',
      totalRating: map['totalRating']?.toDouble() ?? 0.0,
      reviewCount: map['reviewCount']?.toInt() ?? 0,
      averageRating: map['averageRating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));
}

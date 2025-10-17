import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderHistoryProvider = StateProvider<List<Map<String, dynamic>>>((ref) => [
  {
    "orderDate": "2025-10-10",
    "paymentMethod": "Credit Card",
    "totalAmount": 1499.50,
    "items": [
      {
        "name": "Wireless Headphones",
        "price": "₹1499",
        "count": 1,
        "image": "assets/images/products/headphones.png",
        "rating": 0.0,
        "review": "",
      },
    ],
  },
]);

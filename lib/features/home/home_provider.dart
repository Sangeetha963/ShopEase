import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {"name": "Electronics", "icon": Icons.phone_android},
    {"name": "Fashion", "icon": Icons.checkroom},
    {"name": "Home", "icon": Icons.home},
    {"name": "Beauty", "icon": Icons.brush},
    {"name": "Toys", "icon": Icons.toys},
    {"name": "Sports", "icon": Icons.sports_soccer},
    {"name": "Books", "icon": Icons.book},
    {"name": "More", "icon": Icons.more_horiz},
  ];
});

import 'package:flutter/material.dart';                // ✅ Needed for Icons
import 'package:flutter_riverpod/flutter_riverpod.dart'; // ✅ Needed for StateProvider

// Holds currently selected category name
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

// Category list
final categoryProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {"name": "Electronics", "icon": Icons.phone_android},
    {"name": "Fashion", "icon": Icons.checkroom},
    {"name": "Home", "icon": Icons.home},
    {"name": "Books", "icon": Icons.book},
    {"name": "More", "icon": Icons.more_horiz},
  ];
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistProvider =
    StateNotifierProvider<WishlistNotifier, List<Map<String, String>>>(
  (ref) => WishlistNotifier(),
);

class WishlistNotifier extends StateNotifier<List<Map<String, String>>> {
  WishlistNotifier() : super([]);

  void toggleWishlist(Map<String, String> product) {
    final exists = state.any((p) => p['name'] == product['name']);
    if (exists) {
      state = state.where((p) => p['name'] != product['name']).toList();
    } else {
      state = [...state, product];
    }
  }

  bool isInWishlist(Map<String, String> product) {
    return state.any((p) => p['name'] == product['name']);
  }
}

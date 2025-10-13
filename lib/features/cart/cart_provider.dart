import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Map<String, dynamic>>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  CartNotifier() : super([]);

  void addToCart(Map<String, dynamic> product) {
    final index = state.indexWhere((p) => p['name'] == product['name']);
    if (index >= 0) {
      // Increase count if already in cart
      final updated = Map<String, dynamic>.from(state[index]);
      updated['count'] = (updated['count'] ?? 1) + 1;
      state = [...state]..[index] = updated;
    } else {
      state = [...state, {...product, 'count': 1}];
    }
  }

  void removeFromCart(Map<String, dynamic> product) {
    state = state.where((p) => p['name'] != product['name']).toList();
  }

  void updateCount(Map<String, dynamic> product, int count) {
    if (count <= 0) {
      removeFromCart(product);
      return;
    }
    final index = state.indexWhere((p) => p['name'] == product['name']);
    if (index >= 0) {
      final updated = Map<String, dynamic>.from(state[index]);
      updated['count'] = count;
      state = [...state]..[index] = updated;
    }
  }

  void clearCart() {
    state = [];
  }
}

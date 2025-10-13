import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/recommended_products.dart';
import '../cart/cart_page.dart';
import '../cart/cart_provider.dart';

// State provider to hold the search query
final searchQueryProvider = StateProvider<String>((ref) => "");

class SearchScreen extends ConsumerWidget {
  final String initialQuery;
  const SearchScreen({super.key, required this.initialQuery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Set initial query on screen load
    ref.read(searchQueryProvider.notifier).state = initialQuery;

    final query = ref.watch(searchQueryProvider);

    // Filter products based on search query (only name)
    final filteredProducts = recommendedProducts.where((product) {
      final name = product['name']!.toLowerCase();
      final q = query.toLowerCase();
      return name.contains(q);
    }).toList();

    final cartCount = ref.watch(cartProvider).length;

    return Scaffold(
      // appBar: AppBar(
      //   title: TextField(
      //     autofocus: true,
      //     decoration: InputDecoration(
      //       hintText: initialQuery.isNotEmpty ? initialQuery : 'Search products...',
      //       border: InputBorder.none,
      //     ),
      //     onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
      //   ),
      //   actions: [
      //     if (cartCount > 0)
      //       TextButton.icon(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (_) => const CartPage()),
      //           );
      //         },
      //         icon: const Icon(Icons.shopping_cart, color: Colors.white),
      //         label: Text('$cartCount', style: const TextStyle(color: Colors.white)),
      //       ),
      //   ],
      // ),
      body: filteredProducts.isEmpty
          ? const Center(child: Text("No products found"))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['name']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product['price']!,
                          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            ref.read(cartProvider.notifier).addToCart(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Added to Cart")),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size.fromHeight(30),
                          ),
                          child: const Text('Add to Cart', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

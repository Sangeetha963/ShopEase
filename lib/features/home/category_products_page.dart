import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/recommended_products.dart';
import '../cart/cart_page.dart';
import '../cart/cart_provider.dart';
import '../wishlist/wishlist_provider.dart';
import '../product/product_detail_page.dart';
class CategoryProductsPage extends ConsumerWidget {
  final String categoryName;

  const CategoryProductsPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredProducts = recommendedProducts
        .where((p) => p['category'] == categoryName)
        .toList();
    final cartCount = ref.watch(cartProvider).length;

    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive layout logic
    int crossAxisCount;
    double childAspectRatio;

    if (screenWidth >= 1200) {
      crossAxisCount = 5;
      childAspectRatio = 0.65;
    } else if (screenWidth >= 800) {
      crossAxisCount = 4;
      childAspectRatio = 0.7;
    } else if (screenWidth >= 600) {
      crossAxisCount = 3;
      childAspectRatio = 0.7;
    } else {
      crossAxisCount = 2;
      childAspectRatio = 0.75;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        actions: [
          if (cartCount > 0)
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                );
              },
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              label: Text(
                '$cartCount',
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      body: filteredProducts.isEmpty
          ? const Center(child: Text("No products found for this category."))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(product: product),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Hero(
                                  tag: product['name']!,
                                  child: Image.asset(
                                    product['image']!,
                                    fit: BoxFit.contain,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Consumer(
                                  builder: (context, ref, _) {
                                    final wishlist = ref.watch(wishlistProvider);
                                    final isFav = wishlist.any(
                                        (p) => p['name'] == product['name']);

                                    return GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(wishlistProvider.notifier)
                                            .toggleWishlist(product);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              isFav
                                                  ? "Removed from Wishlist 💔"
                                                  : "Added to Wishlist ❤️",
                                            ),
                                            duration:
                                                const Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      child: AnimatedScale(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        scale: isFav ? 1.2 : 1.0,
                                        curve: Curves.easeOutBack,
                                        child: AnimatedSwitcher(
                                          duration: const Duration(
                                              milliseconds: 200),
                                          transitionBuilder:
                                              (child, animation) =>
                                                  FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          ),
                                          child: Icon(
                                            key: ValueKey(isFav),
                                            isFav
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: isFav
                                                ? Colors.red
                                                : Colors.black,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product['name']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            product['price']!,
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .read(cartProvider.notifier)
                                        .addToCart(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Added to Cart")),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    minimumSize:
                                        const Size.fromHeight(30),
                                  ),
                                  child: const Text(
                                    'Add to Cart',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .read(cartProvider.notifier)
                                        .addToCart(product);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const CartPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    minimumSize:
                                        const Size.fromHeight(30),
                                  ),
                                  child: const Text(
                                    'Buy Now',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

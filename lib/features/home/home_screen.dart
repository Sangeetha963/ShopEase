import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/footer_widget.dart';
import 'deals_banner.dart';
import 'home_provider.dart';
import 'category_products_page.dart';
import '../../data/recommended_products.dart';
import '../search/search_screen.dart';
import '../cart/cart_page.dart';
import '../search/voice_search_service.dart';
import '../profile/profile_screen.dart';
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final VoiceSearchService voiceService = VoiceSearchService();
  List<String> voiceKeywords = [];
  List<Map<String, String>> filteredProducts = recommendedProducts;

  void _filterProducts(String query) {
    final keywords = query.toLowerCase().split(' ');
    setState(() {
      voiceKeywords = keywords;
      filteredProducts = recommendedProducts.where((product) {
        final name = product['name']!.toLowerCase();
        return keywords.any((kw) => name.contains(kw));
      }).toList();
    });
  }

  @override
  void dispose() {
    voiceService.stopListening();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: AppColors.primaryBlue,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                const Text(
                  'ShopEase',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {
                              if (value.trim().isNotEmpty) {
                                _filterProducts(value.trim());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        SearchScreen(initialQuery: value.trim()),
                                  ),
                                );
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: 'Search for products',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.mic, color: Colors.grey),
                          onPressed: () async {
                            bool available = await voiceService.initSpeech();
                            if (!available) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Voice search not available"),
                                ),
                              );
                              return;
                            }

                            await voiceService.startListening((result) {
                              searchController.text = result;
                              _filterProducts(result);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
               IconButton(
                    icon: const Icon(Icons.account_circle, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileScreen()),
                      );
                    },
                  ),
                IconButton(
                  icon: const Icon(Icons.list_alt, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                      const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Display captured keywords
            if (voiceKeywords.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Wrap(
                  spacing: 6,
                  children: voiceKeywords
                      .map((kw) => Chip(
                            label: Text(kw),
                            backgroundColor: AppColors.primaryBlue.withOpacity(0.2),
                          ))
                      .toList(),
                ),
              ),

            // Category Slider
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CategoryProductsPage(categoryName: category['name']),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.primaryBlue,
                            child: Icon(category['icon'], color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(category['name'],
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            const DealsBanner(),
            const SizedBox(height: 40),

            // Recommended Products Carousel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recommended for You",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredProducts.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CategoryProductsPage(
                                  categoryName: product['category']!,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Image.asset(
                                    product['image']!,
                                    height: 140,
                                    width: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product['name']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    product['price']!,
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 40),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}

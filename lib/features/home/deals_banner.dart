import 'package:flutter/material.dart';
import "category_products_page.dart";
class DealsBanner extends StatelessWidget {
  const DealsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // Add categories to banners
    final List<Map<String, String>> flashDeals = [
      {
        "image": "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=600&q=80",
        "category": "Electronics"
      },
      {
        "image": "https://images.unsplash.com/photo-1521334884684-d80222895322?auto=format&fit=crop&w=600&q=80",
        "category": "Home"
      },
      {
        "image": "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?auto=format&fit=crop&w=600&q=80",
        "category": "Fashion"
      },
    ];

    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: flashDeals.length,
        itemBuilder: (context, index) {
          final deal = flashDeals[index];
          return GestureDetector(
            onTap: () {
              // Navigate to CategoryProductsPage on tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryProductsPage(categoryName: deal['category']!),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    deal['image']!,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.2),
                    alignment: Alignment.center,
                    child: const Text(
                      'Flash Deals 🔥',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

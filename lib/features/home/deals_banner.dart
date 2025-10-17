import 'dart:async';
import 'package:flutter/material.dart';
import "category_products_page.dart";

class DealsBanner extends StatefulWidget {
  const DealsBanner({super.key});

  @override
  State<DealsBanner> createState() => _DealsBannerState();
}

class _DealsBannerState extends State<DealsBanner> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  final List<Map<String, String>> flashDeals = [
  {
    "image": "assets/images/products/electronics.png",
    "category": "Electronics"
  },
  {
    "image": "assets/images/products/home.png",
    "category": "Home"
  },
  {
    "image": "assets/images/products/fashion.png",
    "category": "Fashion"
  },
];

  double scrollSpeed = 1.0;
  double cardWidth = 250;

  @override
  void initState() {
    super.initState();

    // Continuous horizontal scroll
    _timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset + scrollSpeed;

        if (currentScroll >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(currentScroll);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repeatedDeals =
        List.generate(10, (_) => flashDeals).expand((x) => x).toList();

    return SizedBox(
      height: 180,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: repeatedDeals.length,
        itemBuilder: (context, index) {
          final deal = repeatedDeals[index];

          return AnimatedBuilder(
            animation: _scrollController,
            builder: (context, child) {
              // Calculate center position of card
              double offset = 0;
              if (_scrollController.hasClients) {
                offset = _scrollController.offset;
              }
              double cardCenter = index * (cardWidth + 16) + cardWidth / 2;
              double viewportCenter = offset + MediaQuery.of(context).size.width / 2;
              double distanceFromCenter = (viewportCenter - cardCenter).abs();

              // Parallax effect: closer to center = scale 1.0, farther = smaller
              double scale = 1 - (distanceFromCenter / MediaQuery.of(context).size.width);
              scale = scale.clamp(0.85, 1.0); // Min scale 0.85

              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryProductsPage(categoryName: deal['category']!),
                  ),
                );
              },
              child: Container(
                width: cardWidth,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                 child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Use Image.asset for local assets
                        Image.asset(
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
              ),
            ),
          );
        },
      ),
    );
  }
}

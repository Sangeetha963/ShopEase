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

  double scrollSpeed = 1.0; // Pixels per tick

  @override
  void initState() {
    super.initState();

    // Start a periodic timer to scroll continuously
    _timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset + scrollSpeed;

        if (currentScroll >= maxScroll) {
          // Jump back to start to create circular effect
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
    // Repeat the list to create infinite loop illusion
    final repeatedDeals = List.generate(10, (_) => flashDeals).expand((x) => x).toList();

    return SizedBox(
      height: 180,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(), // Disable manual scroll
        itemCount: repeatedDeals.length,
        itemBuilder: (context, index) {
          final deal = repeatedDeals[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      CategoryProductsPage(categoryName: deal['category']!),
                ),
              );
            },
            child: Container(
              width: 250,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
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
            ),
          );
        },
      ),
    );
  }
}

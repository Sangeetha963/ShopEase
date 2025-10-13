import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../cart/cart_provider.dart';
import 'payment_page.dart';

class BillingPage extends ConsumerWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    double totalPrice = 0;
    for (var item in cartItems) {
      final price = item['price']!.replaceAll('₹', '').replaceAll(',', '');
      final count = item['count'] ?? 1;
      totalPrice += (double.tryParse(price) ?? 0) * count;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Billing")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartItems[index];
                  final count = product['count'] ?? 1;
                  return ListTile(
                    leading: Image.asset(product['image']!, width: 50, height: 50),
                    title: Text(product['name']!),
                    subtitle: Text('₹${product['price']} x $count'),
                    trailing: Text(
                      '₹${(double.tryParse(product['price']!.replaceAll('₹', '').replaceAll(',', '')) ?? 0) * count}',
                    ),
                  );
                },
              ),
            ),
            Text(
              "Total: ₹$totalPrice",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to Payment Page with total price
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PaymentPage(totalPrice: totalPrice),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: const Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}

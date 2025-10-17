import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'order_provider.dart';

class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderHistory = ref.watch(orderHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
      ),
      body: orderHistory.isEmpty
          ? const Center(
              child: Text(
                "No orders placed yet.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                final order = orderHistory[index];
                final items = order['items'] as List<Map<String, dynamic>>;
                final payment = order['paymentMethod'];
                final total = order['totalAmount'];
                final date = DateTime.parse(order['orderDate']);

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Order #${index + 1} - ₹${total.toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Paid via $payment on ${date.day}/${date.month}/${date.year}",
                      style: const TextStyle(fontSize: 13),
                    ),
                    children: items.map((item) {
                      final count = item['count'] ?? 1;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Image.asset(
                                item['image']!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                              title: Text(item['name']!),
                              subtitle: Text(
                                "₹${item['price']} x $count = ₹${(double.tryParse(item['price']!.replaceAll('₹', '').replaceAll(',', '')) ?? 0) * count}",
                              ),
                            ),

                            // ⭐ Product Reviews & Ratings Section
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Rate this Product:",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: List.generate(5, (starIndex) {
                                      final isSelected = (item['rating'] ?? 0.0) > starIndex;
                                      return IconButton(
                                        icon: Icon(
                                          isSelected ? Icons.star : Icons.star_border,
                                          color: Colors.amber,
                                        ),
                                        onPressed: () {
                                          final updatedOrders = [...orderHistory];
                                          updatedOrders[index]['items'][items.indexOf(item)]['rating'] =
                                              (starIndex + 1).toDouble();
                                          ref.read(orderHistoryProvider.notifier).state = updatedOrders;
                                        },
                                      );
                                    }),
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      hintText: "Write a review...",
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(8),
                                    ),
                                    onSubmitted: (text) {
                                      final updatedOrders = [...orderHistory];
                                      updatedOrders[index]['items'][items.indexOf(item)]['review'] = text;
                                      ref.read(orderHistoryProvider.notifier).state = updatedOrders;
                                    },
                                  ),
                                  if ((item['review'] ?? "").isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "Your Review: ${item['review']}",
                                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
    );
  }
}

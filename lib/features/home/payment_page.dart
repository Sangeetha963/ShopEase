import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../profile/order_provider.dart';
import '../cart/cart_provider.dart';

class PaymentPage extends ConsumerStatefulWidget {
  final double totalPrice;

  const PaymentPage({super.key, required this.totalPrice});

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Choose Payment Method")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Select Payment Method:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...["UPI", "Credit Card", "Debit Card", "Cash on Delivery"].map(
              (method) => RadioListTile<String>(
                title: Text(method),
                value: method,
                groupValue: selectedMethod,
                onChanged: (value) {
                  setState(() => selectedMethod = value);
                },
              ),
            ),
            const Spacer(),
            if (selectedMethod != null)
              Column(
                children: [
                  Text(
                    "Final Bill: ₹${widget.totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // ✅ Save order to order history
                      final orderDetails = {
                        'items': List<Map<String, dynamic>>.from(cartItems),
                        'paymentMethod': selectedMethod,
                        'totalAmount': widget.totalPrice,
                        'orderDate': DateTime.now().toString(),
                      };

                      final orders = ref.read(orderHistoryProvider.notifier);
                      orders.state = [...orders.state, orderDetails];

                      // ✅ Clear the cart after successful payment
                      ref.read(cartProvider.notifier).state = [];

                      // ✅ Show confirmation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Payment Successful! Order Saved.")),
                      );

                      // ✅ Navigate back to Home
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Proceed Payment"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

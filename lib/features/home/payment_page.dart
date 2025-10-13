import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentPage extends StatefulWidget {
  final double totalPrice;

  const PaymentPage({super.key, required this.totalPrice});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
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
            RadioListTile<String>(
              title: const Text("UPI"),
              value: "UPI",
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Credit Card"),
              value: "Credit Card",
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Debit Card"),
              value: "Debit Card",
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Cash on Delivery"),
              value: "Cash on Delivery",
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value;
                });
              },
            ),
            const Spacer(),
            if (selectedMethod != null)
              Column(
                children: [
                  Text(
                    "Final Bill: ₹${widget.totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Payment Successful!")),
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
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

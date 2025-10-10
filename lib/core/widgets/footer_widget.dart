import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: const [
              Text("About Us"),
              Text("Contact"),
              Text("Careers"),
              Text("Privacy Policy"),
              Text("Terms of Service"),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "© 2025 ShopEase. All rights reserved.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

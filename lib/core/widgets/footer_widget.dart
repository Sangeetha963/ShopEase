import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures full width
      color: AppColors.primaryBlue, // Matches AppBar color
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 12,
            children: const [
              Text("About Us", style: TextStyle(color: Colors.white)),
              Text("Contact", style: TextStyle(color: Colors.white)),
              Text("Careers", style: TextStyle(color: Colors.white)),
              Text("Privacy Policy", style: TextStyle(color: Colors.white)),
              Text("Terms of Service", style: TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "© 2025 ShopEase. All rights reserved.",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  final List<Map<String, String>> notifications = const [
    {
      "title": "New Offer on Electronics!",
      "message": "Up to 50% off on top brands. Hurry before it ends!",
      "time": "2 hours ago"
    },
    {
      "title": "Your Order has been Shipped",
      "message": "Order #1234 is on the way. Track your delivery now.",
      "time": "5 hours ago"
    },
    {
      "title": "New Product Arrivals",
      "message": "Discover the latest trends in fashion this week.",
      "time": "1 day ago"
    },
    {
      "title": "Flash Deal Reminder 🔥",
      "message": "Limited-time discounts on home appliances!",
      "time": "2 days ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primaryBlue.withOpacity(0.15),
              child: const Icon(Icons.notifications, color: AppColors.primaryBlue),
            ),
            title: Text(
              notif['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(notif['message']!),
            trailing: Text(
              notif['time']!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}

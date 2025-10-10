import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🧠 Initialize any services here later (e.g., Hive, SharedPreferences)
  // await Hive.initFlutter();
  // await SharedPreferences.getInstance();

  runApp(const ProviderScope(child: ShopEaseApp()));
}

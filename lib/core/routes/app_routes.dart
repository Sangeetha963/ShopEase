import 'package:flutter/material.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/home/home_screen.dart';

// Define all route names
class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';
  static const String productDetail = '/product_detail';
  // Add more as you build the app

  // onGenerateRoute function
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case login:
      //   return MaterialPageRoute(builder: (_) => const LoginScreen());
      // case productDetail:
      //   return MaterialPageRoute(builder: (_) => const ProductDetailScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this page')),
          ),
        );
    }
  }
}

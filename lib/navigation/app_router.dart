import 'package:flutter/material.dart';
import 'package:shoppi_flutter/pages/connexion_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyConnexion());
      default:
        return MaterialPageRoute(builder: (_) => const MyConnexion());
    }
  }
}
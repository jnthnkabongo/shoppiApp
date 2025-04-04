import 'package:flutter/material.dart';
import 'package:shoppi_flutter/pages/home/accueil.dart';
import 'package:shoppi_flutter/pages/auth/connexion_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyConnexion());
        case '/accueil':
        return MaterialPageRoute(builder: (_) => const MyAccueil());
      default:
        return MaterialPageRoute(builder: (_) => const MyConnexion());
    }
  }
}
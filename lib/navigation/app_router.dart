import 'package:flutter/material.dart';
import 'package:shoppi_flutter/pages/auth/connexion_page.dart';
import 'package:shoppi_flutter/shared/widgets/menu.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyConnexion());
        case '/accueil':
        return MaterialPageRoute(builder: (_) =>  MenuUtils());
      default:
        return MaterialPageRoute(builder: (_) => const MyConnexion());
    }
  }
}
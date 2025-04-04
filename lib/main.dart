import 'package:flutter/material.dart';
import 'package:shoppi_flutter/core/theme/app_theme.dart';
import 'package:shoppi_flutter/navigation/app_router.dart';
import 'package:shoppi_flutter/pages/auth/connexion_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MyConnexion(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoppi_flutter/shared/widgets/app_bar_widget.dart';
import 'package:shoppi_flutter/shared/widgets/category_list.dart';
import 'package:shoppi_flutter/pages/home/presentation/widgets/product_list.dart';
import 'package:shoppi_flutter/shared/widgets/search_bar.dart';

class MyAccueil extends StatefulWidget {
  const MyAccueil({super.key});

  @override
  State<MyAccueil> createState() => _MyAccueilState();
}

class _MyAccueilState extends State<MyAccueil> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: 'CREDITSHO AFRICA RDC',
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: null, // désactivé pour l'instant
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(), // 🔎 Barre de recherche
            CategoryList(),    // 📂 Liste des catégories
            ProductList(title: "Meilleures Ventes"), // 🛍️ Produits
            ProductList(title: ""), // 🛍️ Produits
          ],
        ),
      ),
    );
  }
}

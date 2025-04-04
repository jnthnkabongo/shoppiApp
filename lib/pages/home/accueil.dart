import 'package:flutter/material.dart';
import 'package:shoppi_flutter/shared/widgets/app_bar_widget.dart';
import 'package:shoppi_flutter/shared/widgets/category_list.dart';
import 'package:shoppi_flutter/pages/home/presentation/widgets/product_list.dart';
import 'package:shoppi_flutter/shared/widgets/search_bar.dart';


class MyAccueil extends StatelessWidget {
  const MyAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'CREDITSHOP', // Le titre de l'AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SearchBarWidget(), // 🔎 Barre de recherche
            CategoryList(), // 📂 Liste des catégories
            ProductList(title: "Meilleures Ventes"), // 🏆 Liste des produits
          ],
        ),
      ),
    );
  }
}

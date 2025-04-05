import 'package:flutter/material.dart';
import 'package:shoppi_flutter/shared/widgets/category_card.dart';

class Product {
  final String name;
  final String price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class ProductList extends StatelessWidget {
  final String title;

  const ProductList({super.key, required this.title});

   @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(name: "Canadian 1.5L", price: "950 FC", image: "assets/images/images_(1).jpeg"),
      Product(name: "Canadian 700ml", price: "900 FC", image: "assets/images/images.jpeg"),
      Product(name: "Pommes", price: "600 FC", image: "assets/images/pommes.webp"),
      Product(name: "Hamburger 1L", price: "800 FC", image: "assets/images/hamburger.jpeg"),
      // Ajoute d'autres produits ici
      Product(name: "Fanta 1L", price: "750 FC", image: "assets/images/fanta.jpeg"), // Exemple de produit supplémentaire
      Product(name: "Sprite 1L", price: "700 FC", image: "assets/images/sprite.jpeg"), // Exemple de produit supplémentaire
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const Text(
                'Voir',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: products.map((product) {
              return SizedBox(
                width: 170,
                child: ProductCard(
                  title: product.name,
                  price: product.price,
                  image: product.image,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
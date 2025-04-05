import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // Afficher l'image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12), bottom: Radius.circular(12)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity, // Laisse cette ligne pour garder la hauteur, si souhaité
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  color: Colors.grey[100],
                  child: const Center(child: Text('Image non disponible', style: TextStyle(color: Colors.red))),
                );
              },
            ),
          ),
          // Texte superposé en haut
           Positioned(
            bottom: 10, // Positionne le texte en bas
            left: 0,    // Commence à gauche
            right: 0,   // S'étend jusqu'à la droite
            child: Align(
              alignment: Alignment.bottomCenter, // Centre horizontalement
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center, // Centre le texte
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 12, color: Colors.red), // Couleur du texte
                    textAlign: TextAlign.center, // Centre le texte
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
      Product(name: "Canadian 1.5L", price: "950 FC", image: "assets/images/images.jpeg"),
      Product(name: "Canadian 700ml", price: "900 FC", image: "assets/images/image.webp"),
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
              const Text('Voir', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red)),
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
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
      elevation: 6, // Élévation un peu plus marquée pour un effet de profondeur
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Image du produit avec un fadeInImage et fallback pour une meilleure expérience utilisateur
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.jpg',
              image: image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              fadeInDuration: const Duration(milliseconds: 300),
              fadeOutDuration: const Duration(milliseconds: 300),
              imageErrorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Text(
                      'Image non disponible',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
            // Titre et prix en bas de l'image avec un fond semi-transparent
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
      Product(
          name: "Canadian 700ml",
          price: "900 FC",
          image: "assets/images/image.webp"),
      Product(
          name: "Canadian 700ml",
          price: "900 FC",
          image: "assets/images/image.webp"),
      Product(
          name: "Pommes", price: "600 FC", image: "assets/images/pommes.webp"),
      Product(
          name: "Hamburger 1L",
          price: "800 FC",
          image: "assets/images/hamburger.jpeg"),
      Product(
          name: "Fanta 1L", price: "750 FC", image: "assets/images/fanta.jpeg"),
      Product(
          name: "Sprite 1L",
          price: "700 FC",
          image: "assets/images/sprite.jpeg"),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Naviguer vers une page complète des produits
                },
                child: const Text(
                  'Voir tout',
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        // Utilisation de GridView pour mieux organiser les produits en plusieurs colonnes
        SizedBox(
          height: 250,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Deux colonnes pour plus de fluidité
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7, // Aspect ratio pour plus de compacité
            ),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                title: product.name,
                price: product.price,
                image: product.image,
              );
            },
          ),
        ),
      ],
    );
  }
}

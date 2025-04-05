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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120, // Laisse cette ligne pour garder la hauteur, si souhaité
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
            top: 10, // Ajuste la position verticale pour le texte
            left: 8,  // Ajuste la position horizontale pour le texte
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche pour le titre
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 2.0),
                Text(
                  price,
                  style: const TextStyle(fontSize: 12, color: Colors.yellowAccent), // Couleur du texte
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String placeholder;

  const CategoryCard(
    this.name,
    this.imageUrl, { required this.placeholder, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 80,
              width: 80,
              errorBuilder: (context, error, stackTrace) {
                return ClipOval(
                  child: Image.asset(
                    placeholder,
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Petit-déjeuner',
        'image': 'assets/images/image.jpeg',
        'placeholder': 'assets/images/placeholder.jpeg'
      },
      {
        'name': 'Boulangerie',
        'image': 'assets/images/images_(1).jpeg',
        'placeholder': 'assets/images/placeholder.jpeg'
      },
      {
        'name': 'Fruits & légumes',
        'image': 'assets/images/images.jpeg',
        'placeholder': 'assets/images/placeholder.jpeg'
      },
      {
        'name': 'Produits laitiers',
        'image': 'assets/images/images_(1).jpeg',
        'placeholder': 'assets/images/images_(1).jpeg'
      },
    ];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Catégories',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Voir',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((category) {
              return CategoryCard(
                category['name']!,
                category['image']!,
                placeholder: category['placeholder']!,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String placeholder;

  const CategoryCard(
    this.name,
    this.imageUrl, {
    required this.placeholder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Material(
  elevation: 2,
  shape: const CircleBorder(),
  clipBehavior: Clip.antiAlias,
  child: InkWell(
    onTap: () {
      // TODO: Gérer le clic sur une catégorie
    },
    child: SizedBox(
      height: 80,
      width: 80,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            placeholder,
            fit: BoxFit.cover,
          );
        },
      ),
    ),
  ),
),

          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
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
        'placeholder': 'assets/images/placeholder.jpeg'
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Catégories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Naviguer vers la page complète
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Voir plus"),
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

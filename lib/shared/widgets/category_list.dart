import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["Petit-déjeuner", "Boulangerie", "Fruits & légumes", "Produits laitiers"];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Catégories', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text('Voir', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((name) => CategoryCard(name)).toList(),
          ),
        ),
      ],
    );
  }
}

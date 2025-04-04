import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductList extends StatelessWidget {
  final String title;

  const ProductList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final products = [
      {"name": "Canadian 1.5L", "price": "950 FC"},
      {"name": "Canadian 700ml", "price": "900 FC"},
      {"name": "Swissta 3", "price": "600 FC"},
      {"name": "Coca-Cola 1L", "price": "800 FC"},
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
            children: products.map((p) => ProductCard(title: p["name"]!, price: p["price"]!)).toList(),
          ),
        ),
      ],
    );
  }
}

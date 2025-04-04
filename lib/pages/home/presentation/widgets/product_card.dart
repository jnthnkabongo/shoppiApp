import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;

  const ProductCard({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Text(price, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}

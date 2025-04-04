import 'package:flutter/material.dart';

class MyAccueil extends StatefulWidget {
  const MyAccueil({super.key});

  @override
  State<MyAccueil> createState() => _MyAccueil();
}

class _MyAccueil extends State<MyAccueil> {

  int pagesIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue chez Rabby Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher des produits',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 15, left: 15),
                    child: Text(
                      'Catégories',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 15, right: 15),
                    child: Text(
                      'Voir',
                      style: TextStyle(
                        fontSize: 15, 
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard('Petit-déjeuner'),
                  CategoryCard('Boulangerie'),
                  CategoryCard('Fruits & légumes'),
                  CategoryCard('Produits laitiers'),
                ],
              ),
            ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10, left: 15),
                    child: Text(
                      'Meilleurs Ventes',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10, right: 15),
                    child: Text(
                      'Voir',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 1,
                scrollDirection: Axis.horizontal,
                children: const [
                  ProductCard('Canadian 1.5L', '950 FC'),
                  ProductCard('Canadian 700ml', '900 FC'),
                  ProductCard('Swissta 3', '600 FC'),
                  ProductCard('Coca-Cola 1L', '800 FC'),
                  ProductCard('Canadian 1.5L', '950 FC'),
                  ProductCard('Canadian 700ml', '900 FC'),
                  ProductCard('Swissta 3', '600 FC'),
                  ProductCard('Coca-Cola 1L', '800 FC'),
                ],
              ),
            ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10, left: 15),
                    child: Text(
                      'Meilleurs Ventes',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10, right: 15),
                    child: Text(
                      'Voir',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 1,
                scrollDirection: Axis.horizontal,
                children: const [
                  ProductCard('Canadian 1.5L', '950 FC'),
                  ProductCard('Canadian 700ml', '900 FC'),
                  ProductCard('Swissta 3', '600 FC'),
                  ProductCard('Coca-Cola 1L', '800 FC'),
                  ProductCard('Canadian 1.5L', '950 FC'),
                  ProductCard('Canadian 700ml', '900 FC'),
                  ProductCard('Swissta 3', '600 FC'),
                  ProductCard('Coca-Cola 1L', '800 FC'),
                ],
              ),
            ),
          ],
        ),
      
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: pagesIndex,
        onDestinationSelected: (int index){
          setState(() {
            pagesIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Accueil"),
          NavigationDestination(icon: Icon(Icons.equalizer), label: "Rapport")

      ]),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;

  const CategoryCard(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Center(
            // Aucun texte ici
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;

  const ProductCard(this.title, this.price);

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
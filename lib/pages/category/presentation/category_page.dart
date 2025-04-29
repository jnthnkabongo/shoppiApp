import 'package:flutter/material.dart';
import 'package:shoppi_flutter/shared/widgets/search_bar.dart';

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
      width: 100, // Largeur fixe pour chaque carte
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Espace entre les cartes
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
      // Vous pouvez ajouter d'autres catégories ici
    ];

    return Wrap(
      spacing: 16, // Espace horizontal entre les éléments
      runSpacing: 16, // Espace vertical entre les lignes
      children: categories.map((category) {
        return CategoryCard(
          category['name']!,
          category['image']!,
          placeholder: category['placeholder']!,
        );
      }).toList(),
    );
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catégories'),
        backgroundColor: Colors.red,
      ),
      body: 
          SingleChildScrollView(
              child: Column(
                children: const [
                   SearchBarWidget(),
                  CategoryList(), // Ajout de CategoryList sans Row
                ],
              ),
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CategoryPage(),
  ));
}

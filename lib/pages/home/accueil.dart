// import 'package:flutter/material.dart';
// import 'package:shoppi_flutter/shared/widgets/app_bar_widget.dart';
// import 'package:shoppi_flutter/shared/widgets/category_list.dart';
// import 'package:shoppi_flutter/pages/home/presentation/widgets/product_list.dart';
// import 'package:shoppi_flutter/shared/widgets/search_bar.dart';


// class MyAccueil extends StatefulWidget {
//   const MyAccueil({super.key});

//   @override
//   State<MyAccueil> createState() => _MyAccueil();
// }

// class _MyAccueil extends State<MyAccueil> {

//   int pagesIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarWidget(
//         title: 'CREDITSHOP', // Le titre de l'AppBar
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.location_on),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body:
//       const SingleChildScrollView(
//         child: Column(
//           children: [
//             SearchBarWidget(), // 🔎 Barre de recherche
//             CategoryList(), // 📂 Liste des catégories
//             ProductList(title: "Meilleures Ventes"), // 🏆 Liste des produits
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shoppi_flutter/shared/widgets/app_bar_widget.dart';
import 'package:shoppi_flutter/shared/widgets/category_list.dart';
import 'package:shoppi_flutter/pages/home/presentation/widgets/product_list.dart';
import 'package:shoppi_flutter/shared/widgets/search_bar.dart';

class MyAccueil extends StatefulWidget {
  const MyAccueil({super.key});

  @override
  State<MyAccueil> createState() => _MyAccueil();
}

class _MyAccueil extends State<MyAccueil> {
  final List<Widget> pages = [
    const SingleChildScrollView(
      child: Column(
        children: [
          SearchBarWidget(), // 🔎 Barre de recherche
          CategoryList(), // 📂 Liste des catégories
          ProductList(title: "Meilleures Ventes"), // 🏆 Liste des produits
        ],
      ),
    ),
  ];
  int pagesIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'CREDITSHOP', // Le titre de l'AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {},
          ),
        ],
      ),
      body: pages[pagesIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.apps), label: ''),
          NavigationDestination(icon: Icon(Icons.shopping_bag_rounded), label: ''),
          NavigationDestination(icon: Icon(Icons.sell_rounded), label: ''),
          NavigationDestination(icon: Icon(Icons.settings), label: ''),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            pagesIndex = index;
          });
        },
        selectedIndex: pagesIndex,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoppi_flutter/pages/home/accueil.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({super.key, required this.title});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final pages = [
    const MyAccueil(),
  ];

  int pagesIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pagesIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            color: Colors.black,
          ),
          NavigationBar(
            selectedIndex: pagesIndex,
            onDestinationSelected: (int index) {
              setState(() {
                pagesIndex = index;
              });
            },
            backgroundColor: Colors.white,
            indicatorColor: Colors.blueAccent,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Accueil"),
              NavigationDestination(icon: Icon(Icons.settings), label: "Paramètres"),
              NavigationDestination(icon: Icon(Icons.person_outline_sharp), label: "Utilisateur")
            ],
          ),
        ],
      ),
    );
  }
}
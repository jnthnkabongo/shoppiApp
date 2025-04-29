import 'package:flutter/material.dart';
import 'package:shoppi_flutter/pages/category/presentation/category_page.dart';
import 'package:shoppi_flutter/pages/home/presentation/accueil.dart';
import 'package:shoppi_flutter/pages/panier/presentation/panier.dart';
import 'package:shoppi_flutter/pages/promo/presentation/promo_page.dart';
import 'package:shoppi_flutter/pages/setting/presentation/setting_page.dart.dart';

class MenuUtils extends StatefulWidget {
  @override
  _MenuUtilsState createState() => _MenuUtilsState();
}

class _MenuUtilsState extends State<MenuUtils>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [
    HomePages(),
    VideoPages(),
    InfosPages(),
    RadioPages(),
    AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white.withOpacity(0.95),
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            elevation: 10,
            items: [
  BottomNavigationBarItem(
    icon: AnimatedIconItem(
      icon: Icons.home_filled,
      isSelected: _selectedIndex == 0,
    ),
    label: "Accueil",
  ),
  BottomNavigationBarItem(
    icon: AnimatedIconItem(
      icon: Icons.category,
      isSelected: _selectedIndex == 1,
    ),
    label: "Categorie", // 📂 Icône pour les catégories
  ),
  BottomNavigationBarItem(
    icon: AnimatedIconItem(
      icon: Icons.shopping_cart,
      isSelected: _selectedIndex == 2,
    ),
    label: "Panier", // 🛒 Icône claire pour un panier
  ),
  BottomNavigationBarItem(
    icon: AnimatedIconItem(
      icon: Icons.local_offer,
      isSelected: _selectedIndex == 3,
    ),
    label: "Promo", // 🎁 Offre / Promo
  ),
  BottomNavigationBarItem(
    icon: AnimatedIconItem(
      icon: Icons.settings,
      isSelected: _selectedIndex == 4,
    ),
    label: "Parametre", // ⚙️ Paramètres
  ),
]

            ),
      ),
    );
  }
}

class AnimatedIconItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  AnimatedIconItem({required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(isSelected ? 8.0 : 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? Color(0xFF00AEEF).withOpacity(0.2)
            : Colors.transparent,
      ),
      child: Icon(icon, size: isSelected ? 30 : 24),
    );
  }
}

// ==================== DESIGN DES PAGES ====================
class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBackground(
      child: Center(
        child: MyAccueil(),
      ),
    );
  }
}

class VideoPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBackground(
      child: Center(
        child: CategoryPage(),
      ),
    );
  }
}

class InfosPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBackground(
      child: Center(
        child: CartPage(),
      ),
    );
  }
}

class RadioPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBackground(
      child: Center(
        child: PromoPage(),
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBackground(
      child: Center(
        child: SettingPage(),
      ),
    );
  }
}

// ==================== DESIGN UTILITAIRE ====================
class PageBackground extends StatelessWidget {
  final Widget child;
  PageBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF00AEEF), // Bleu Cyan Digital Congo
            Colors.white,
          ],
        ),
      ),
      child: child,
    );
  }
}

final pageTextStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  shadows: [
    Shadow(
      blurRadius: 4.0,
      color: Colors.black26,
      offset: Offset(2.0, 2.0),
    ),
  ],
);

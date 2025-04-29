import 'package:flutter/material.dart';

// Modèle de produit
class CartItem {
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Liste des articles dans le panier
  List<CartItem> cartItems = [
    CartItem(
      name: 'Petit-déjeuner',
      imageUrl: 'assets/images/image.jpeg',
      price: 5.99,
    ),
    CartItem(
      name: 'Boulangerie',
      imageUrl: 'assets/images/images_(1).jpeg',
      price: 3.50,
    ),
    CartItem(
      name: 'Fruits & légumes',
      imageUrl: 'assets/images/images.jpeg',
      price: 4.25,
    ),
  ];

  // Calcul du prix total du panier
  double get totalPrice {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }
    return total;
  }

  // Fonction pour changer la quantité
  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      cartItems[index].quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Panier'),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('Votre panier est vide.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            )
          : Column(
              children: [
                // Affichage des produits dans le panier avec une liste scrollable
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true, // Limite la hauteur de la liste
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(10),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                                ),
                                title: Text(item.name),
                                subtitle: Text('Prix: \$${item.price.toStringAsFixed(2)}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: item.quantity > 1
                                          ? () {
                                              _updateQuantity(index, item.quantity - 1);
                                            }
                                          : null,
                                    ),
                                    Text('${item.quantity}'),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        _updateQuantity(index, item.quantity + 1);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Section pour le total et le bouton de paiement fixe en bas
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: totalPrice > 0 ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ElevatedButton.icon(
          onPressed: totalPrice > 0
              ? () {
                  // TODO: Ajouter l'action de paiement
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Paiement en cours...')),
                  );
                }
              : null,
          icon: const Icon(Icons.payment, size: 24), // Icône de paiement
          label: const Text(
            'Procéder au paiement',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            minimumSize: Size(double.infinity, 50), // Largeur du bouton
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CartPage(),
  ));
}

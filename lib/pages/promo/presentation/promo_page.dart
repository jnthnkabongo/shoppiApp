import 'package:flutter/material.dart';
import 'package:shoppi_flutter/shared/widgets/search_bar.dart';

class PromoProduct {
  final String name;
  final String imageUrl;
  final String placeholder;
  final double oldPrice;
  final double newPrice;

  PromoProduct({
    required this.name,
    required this.imageUrl,
    required this.placeholder,
    required this.oldPrice,
    required this.newPrice,
  });
}

class PromoProductCard extends StatelessWidget {
  final PromoProduct product;

  const PromoProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Action au clic
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(product.placeholder, fit: BoxFit.cover);
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${product.oldPrice.toStringAsFixed(2)} €",
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      "${product.newPrice.toStringAsFixed(2)} €",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  late List<PromoProduct> promoProducts;

  @override
  void initState() {
    super.initState();

    promoProducts = [
      PromoProduct(
        name: "Paint",
        imageUrl: "assets/images/promo1.jpeg",
        placeholder: "assets/images/images.jpeg",
        oldPrice: 1.50,
        newPrice: 1.00,
      ),
      PromoProduct(
        name: "Lait entier 1L",
        imageUrl: "assets/images/promo2.jpeg",
        placeholder: "assets/images/images.jpeg",
        oldPrice: 1.20,
        newPrice: 0.90,
      ),
      PromoProduct(
        name: "Pommes",
        imageUrl: "assets/images/promo3.jpeg",
        placeholder: "assets/images/images.jpeg",
        oldPrice: 2.80,
        newPrice: 2.00,
      ),
    ];
  }

  void addPromoProduct(PromoProduct product) {
    setState(() {
      promoProducts.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promotions"),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const SearchBarWidget(),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: promoProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    return PromoProductCard(product: promoProducts[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
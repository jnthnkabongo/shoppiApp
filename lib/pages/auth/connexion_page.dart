import 'package:flutter/material.dart';
import 'package:shoppi_flutter/pages/home/presentation/accueil.dart';
import 'package:shoppi_flutter/shared/widgets/custom_button.dart';

class MyConnexion extends StatelessWidget {
  const MyConnexion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image d'arrière-plan
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenu
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'La première application en ligne à Kinshasa',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    'La première application en ligne à Kinshasa pour livrer vos courses rapidement chez vous.',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Commencer vos achats",
                  onPressed: () {}, 
                ),
                CustomButton(
                  text: "Se connecter / S'inscrire",
                  onPressed: () {
                    Navigator.pushNamed(context, '/accueil');
                  }, 
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

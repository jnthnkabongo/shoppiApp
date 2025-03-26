import 'package:flutter/material.dart';


class MyConnexion extends StatefulWidget {
  const MyConnexion({super.key});

  @override
  State<MyConnexion> createState() => _MyConnexion();
  
}
class _MyConnexion extends State<MyConnexion>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Image d'arrière-plan
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image.jpeg'), // Chemin de votre image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Contenu par-dessus
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                    child: Text(
                      'La premiere application en ligne a Kinshasa',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 30, left: 30, bottom: 20),
                   child: Text(
                    'La premiere application em ligne à Kinshasa pour livrer vos courses rapidemment chez vous',
                    textAlign: TextAlign.center,
                   ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text("Commencer vos achats", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text("Se connecter / S'inscrire", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


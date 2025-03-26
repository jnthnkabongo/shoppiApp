import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shoppi_flutter/pages/connexion_page.dart';

class MyLoading extends StatefulWidget {
  const MyLoading({super.key});

  @override
  State<MyLoading> createState() => _MyLoading();
}

class _MyLoading extends State<MyLoading>{

  @override
  void initState(){
    super.initState();
    loadAnimation();
  }

  Future<Timer> loadAnimation() async {
    return Timer(
      const Duration(seconds: 4),
    onLoaded);
  }

  void onLoaded(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MyConnexion(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          "assets/animations/loadind2.json",
          //"assets/animations/loadind2.json",
        repeat: true),
      ),
    );
  }
}
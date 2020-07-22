import 'dart:async';
import 'package:flutter/material.dart';
import 'animalguide.dart';

class AnimalSplashScreen extends StatefulWidget {
  final String name;
  AnimalSplashScreen(this.name);

  @override
  _AnimalSplashScreenState createState() => _AnimalSplashScreenState();
}

class _AnimalSplashScreenState extends State<AnimalSplashScreen> {
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return AnimalGuide();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/animalasset/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Image.asset('assets/animalasset/animal.png', height: 120),
      ),
    );
  }
}

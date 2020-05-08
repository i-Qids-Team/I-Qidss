import 'package:flutter/material.dart';
import 'package:iqidss/SplashScreen.dart';
import 'package:iqidss/vegetables/screen/VegetableHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

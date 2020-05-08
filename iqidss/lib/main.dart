import 'package:flutter/material.dart';
import 'package:iqidss/SplashScreen.dart';
import 'package:iqidss/vegetable/screen/vegetable_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/vegetable_screen': (context) => VegetableScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

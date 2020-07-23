import 'package:flutter/material.dart';
// import 'package:iqidss/SplashScreen.dart';

import 'animal/screen/animalquiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        debugShowCheckedModeBanner: false,
        // home: SplashScreen());        
          home:  AnimalQuiz(0, 0));
  }
}

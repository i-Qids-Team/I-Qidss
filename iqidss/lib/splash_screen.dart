import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:iqidss/Login.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
      return Timer(duration, () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
            return LoginPage();
          }),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
                opacity: 0.5,
                child: Image.asset('assets/background.jpg'),
                
            ),

            Shimmer.fromColors(
              period: Duration(milliseconds: 1500),
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xffe100ff),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "I-Qids",
                  style: TextStyle(
                    fontSize: 90.0,
                    fontFamily: 'Pacifico',
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 18.0,
                        color: Colors.black87,
                        offset: Offset.fromDirection(120, 12)
                      )
                    ]
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
import 'package:flutter/material.dart';
import 'package:iqidss/color/Screens/QuizColor.dart';

class HomeColor extends StatefulWidget {
  @override
  _HomeColorState createState() => _HomeColorState();
}

class _HomeColorState extends State<HomeColor> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
      ),
      body: new Center(
        child: new InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new QuizColor())),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('assets/colors.png')),
              SizedBox(
                height: 2,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                  child: Text(
                    "Start Game",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.red,
                      border: Border.all(color: Colors.white, width: 2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

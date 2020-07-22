import 'package:flutter/material.dart';
import 'package:iqidss/mainpage.dart';
import 'package:iqidss/shape/Screen/GamePage.dart';

class ScoreBoard extends StatefulWidget {
  final int finalscore;
  final String name;
  ScoreBoard(this.finalscore, this.name);

  @override
  _ScoreBoard createState() => _ScoreBoard();
}

class _ScoreBoard extends State<ScoreBoard> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: Text('Score'),
          backgroundColor: Colors.red[300],
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return MainPage();
                  }));
                }),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Container(
            padding: const EdgeInsets.all(68.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/shapebg.gif"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: <Widget>[
              Text("Congratulations!",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20.0),
              Container(
                height: 150,
                child: Image.asset(
                  'assets/happycat.gif',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              Text("Your Score:",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text(widget.finalscore.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              SizedBox(
                height: 50,
                child: RaisedButton.icon(
                  color: Colors.pink[300],
                  textColor: Colors.white,
                  icon: Icon(Icons.keyboard_return),
                  label: Text("Replay",
                      style: TextStyle(fontSize: 18, letterSpacing: 3)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GamePage(widget.name)),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.pink[100], width: 5.0),
                  ),
                ),
              ),
            ])));
  }
}

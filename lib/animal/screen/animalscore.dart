import 'package:flutter/material.dart';
import 'package:iqidss/mainpage.dart';
import 'animalguide.dart';

class AnimalScore extends StatefulWidget {
  final int score;
  AnimalScore({this.score});
  @override
  _AnimalScoreState createState() => _AnimalScoreState();
}

class _AnimalScoreState extends State<AnimalScore> {
  String mark = "";
  @override
  void initState() {
    super.initState();

    switch (widget.score) {
      case 1:
      case 2:
        mark = "It's okey, try again.";
        break;
      case 3:
      case 4:
        mark = "Good, Keep it up!";
        break;
      case 5:
        mark = "Very Good! So close.";
        break;
      case 6:
        mark = "Excellent!";
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Text('Animal'),
        backgroundColor: Colors.red[300],
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return MainPage();
              }));
            },
          ),
        ],
      ),
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "$mark",
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          new Image.asset(
            'assets/main.gif',
            height: 190,
          ),
          SizedBox(
            height: 16,
          ),
          new Text(
            "Your Score: ",
            style: new TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 35),
          ),
          new Text(widget.score.toString() + "/ 6",
              style: new TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.w500,
                  fontSize: 30)),
          Padding(padding: EdgeInsets.only(top: 10)),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimalGuide(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
              child: Text(
                "Replay Quiz",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.lightGreen[200],
                  border: Border.all(color: Colors.white, width: 2)),
            ),
          ),
        ],
      )),
    );
  }
}

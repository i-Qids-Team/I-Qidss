import 'package:flutter/material.dart';
import 'package:iqidss/mainpage.dart';
import 'package:iqidss/color/Screens/HomeColor.dart';

class ResultColor extends StatefulWidget {
  final int score, totalQuestion, correct, incorrect, notattempted;
  ResultColor(
      {this.score,
      this.totalQuestion,
      this.correct,
      this.incorrect,
      this.notattempted});

  @override
  _ResultColorState createState() => _ResultColorState();
}

class _ResultColorState extends State<ResultColor> {
  String greeting = "";
  @override
  void initState() {
    super.initState();

    var percentage = (widget.score / (widget.totalQuestion)) * 100;
    if (percentage >= 90) {
      greeting = "Outstanding";
    } else if (percentage > 80 && percentage < 90) {
      greeting = "Good Work";
    } else if (percentage > 70 && percentage < 80) {
      greeting = "Good Effort";
    } else if (percentage < 70) {
      greeting = "Needs improvement";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage())),
          ),
        ],
      ),
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "$greeting",
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
          new Text(
              widget.score.toString() + "/" + widget.totalQuestion.toString(),
              style: new TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.w500,
                  fontSize: 30)),
          Padding(padding: EdgeInsets.only(top: 10)),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeColor()));
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

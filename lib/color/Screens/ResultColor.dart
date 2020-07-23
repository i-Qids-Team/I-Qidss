import 'package:flutter/material.dart';
import 'package:iqidss/mainpage.dart';
import 'package:iqidss/color/Screens/HomeColor.dart';

import '../../score_models/score.dart';
import '../../score_services/score_data_service.dart';

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

  List<Score> scores = new List<Score>();
  final dataService = ScoreDataService();
  Future<List<Score>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = dataService.getScoreList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Score>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            scores = snapshot.data;

            scores[1].id = snapshot.data[1].id;
            scores[1].score = snapshot.data[1].score;

            scores[1].score = widget.score;
            dataService.updateScore(id: scores[1].id, score: scores[1].score);

            switch (scores[1].score) {
              case 0:
              case 1:
              case 2:
                greeting = "It's okey, try again.";
                break;
              case 3:
              case 4:
                greeting = "Good, Keep it up!";
                break;
              case 5:
                greeting = "Very Good! So close.";
                break;
              case 6:
                greeting = "Excellent!";
                break;
              default:
            }

            return _buildMainScreen(context);
          } else
            return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen(BuildContext context) {
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

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching data in progress'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iqidss/mainpage.dart';
import 'package:iqidss/score_models/score.dart';
import 'package:iqidss/score_services/score_data_service.dart';

import 'GamePage.dart';

class ShapeScore extends StatefulWidget {
  final int score, totalQuestion, correct, incorrect;
  ShapeScore({this.score, this.totalQuestion, this.correct, this.incorrect});

  @override
  _ShapeScore createState() => _ShapeScore();
}

class _ShapeScore extends State<ShapeScore> {
  List<Score> scores = new List<Score>();
  final dataService = ScoreDataService();
  Future<List<Score>> _futureData;

  String achievment = "";

  @override
  void initState() {
    super.initState();
    _futureData = dataService.getScoreList();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<Score>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            scores = snapshot.data;

            scores[2].id = snapshot.data[2].id;
            scores[2].score = snapshot.data[2].score;

            scores[2].score = widget.score;
            dataService.updateScore(id: scores[2].id, score: scores[2].score);

            switch (scores[2].score) {
              case 0:
                achievment = "It's okey, try again.";
                break;
              case 1:
                achievment = "Good, Keep it up!";
                break;
              case 2:
                achievment = "Very Good! So close.";
                break;
              case 3:
                achievment = "Excellent!";
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
          title: Text('Score'),
          backgroundColor: Colors.red[300],
          actions: <Widget>[
            iconButtonAppBar(context),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Container(
            padding: const EdgeInsets.all(65),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildAchievement(),
                  Spacer(),
                  buildPicture(),
                  Spacer(),
                  buildScoreText(),
                  buildScoreValue(),
                  Spacer(),
                  replayButton(context),
                ])));
  }

  SizedBox replayButton(BuildContext context) {
    return SizedBox(
                  height: 50,
                  child: RaisedButton.icon(
                    color: Colors.pink[300],
                    textColor: Colors.white,
                    icon: Icon(Icons.keyboard_return),
                    label: Text("Replay Quiz",
                        style: TextStyle(fontSize: 18, letterSpacing: 3)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new GamePage()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.pink[100], width: 2.0),
                    ),
                  ),
                );
  }

  Text buildScoreValue() {
    return Text(
                    widget.score.toString() +
                        "/" +
                        widget.totalQuestion.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold));
  }

  Text buildScoreText() {
    return Text("Your Score:",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold));
  }

  Container buildPicture() {
    return Container(
                  height: 150,
                  child: Image.asset(
                    'assets/main.gif',
                    fit: BoxFit.contain,
                  ),
                );
  }

  Text buildAchievement() {
    return Text("$achievment",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold));
  }

  IconButton iconButtonAppBar(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return MainPage();
          }));
        });
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

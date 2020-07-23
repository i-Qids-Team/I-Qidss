import 'package:flutter/material.dart';
import 'package:iqidss/mainpage.dart';
import 'package:iqidss/score_models/score.dart';
import 'package:iqidss/score_services/score_data_service.dart';
import 'animalguide.dart';

class AnimalScore extends StatefulWidget {
  final int score;
  AnimalScore({this.score});
  @override
  _AnimalScoreState createState() => _AnimalScoreState();
}

class _AnimalScoreState extends State<AnimalScore> {
  String mark = "";

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
        future:  _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            scores = snapshot.data;

            scores[0].id = snapshot.data[0].id;
            scores[0].score = snapshot.data[0].score;

            scores[0].score = widget.score;
            dataService.updateScore(id: scores[0].id, score: scores[0].score);

            switch (scores[0].score) {
              case 0:
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

            return _buildMainScreen(context);
          } else
            return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen(BuildContext context) {
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
          new Text('${scores[0].score}' + "/ 6",
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

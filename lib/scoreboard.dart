import 'package:flutter/material.dart';
import 'package:iqidss/score_models/score.dart';
import 'package:iqidss/score_services/score_data_service.dart';

class ScoreBoard extends StatefulWidget {
  @override
  _ScoreBoard createState() => _ScoreBoard();
}

class _ScoreBoard extends State<ScoreBoard> {
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
            for (int i = 0; i < snapshot.data.length; i++) {
              
              scores[i].id = snapshot.data[i].id;
              scores[i].score = snapshot.data[i].score;
            }
            return _buildMainScreen();
          } else
            return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScoreBoard!'),
          backgroundColor: Colors.red[300],
        ),
        body: new Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "\nShape",
                  style: TextStyle(fontSize: 25.0, color: Colors.black87),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.pink[100],
                  child: Text(
                    "${scores[2].score}",
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "\nAnimal",
                  style: TextStyle(fontSize: 25.0, color: Colors.black87),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.green[100],
                  child: Text(
                    "${scores[0].score}",
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "\nColours",
                  style: TextStyle(fontSize: 25.0, color: Colors.black87),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.purple[100],
                  child: Text(
                    "${scores[1].score}",
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "\nVegetables",
                  style: TextStyle(fontSize: 25.0, color: Colors.black87),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  child: Text(
                    "${scores[3].score}",
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.pink[50],
            image: DecorationImage(
                image: AssetImage("assets/main.gif"),
                alignment: Alignment.bottomCenter),
          ),
        ));
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

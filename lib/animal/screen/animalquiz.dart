import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqidss/animal/model/animaldata.dart';
import 'package:iqidss/animal/model/animaldataglobal.dart';
import 'package:iqidss/animal/model/animaldbdata.dart';
import 'package:iqidss/animal/service/animal_data_service.dart';
import '../../mainpage.dart';
import 'answeranimal.dart';
import 'dragobject.dart';

class AnimalQuiz extends StatefulWidget {
  final int index;
  final int totalScore;
  AnimalQuiz(this.index, this.totalScore);
  @override
  _AnimalQuizState createState() => _AnimalQuizState();
}

class _AnimalQuizState extends State<AnimalQuiz> {
  Timer timer;
  int time = 10;
  int scores = 0;
  int random = 0;
  final Map<String, bool> score = {};
  AudioCache player = AudioCache();

  List<AnimalData> animal = globalAnimalsList;

  //firebase
  List<AnimalDBData> animalDB = new List<AnimalDBData>();
  final dataService = AnimalDataService();
  Future<List<AnimalDBData>> _futureData;

  void initState() {
    super.initState();
    startAnimalScreen();
    animalAudio();
    _futureData = dataService.getAnimalList();
  }

    @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimalDBData>>(
        future: _futureData,
        builder: (context, snapshot) {         
          if (snapshot.hasData) {
             animalDB = snapshot.data;
            for (int i = 0; i < snapshot.data.length; i++) {
              animalDB[i].name = snapshot.data[i].name;
              animalDB[i].height = snapshot.data[i].height;
            }
            return _buildMainScreen();
          } else
            return _buildFetchingDataScreen();
        });
  }

  int _totalScores() {
    return widget.totalScore + 1;
  }

  animalAudio() {
    player.play(animal[widget.index].audio);
  }

  startAnimalScreen() async {
    Timer.periodic(Duration(seconds: 1), (t) {
      if (time == 0) {
        t.cancel();
        // AnswerAnimal({this.image, this.animal, this.status, this.color, this.audio});
        if (scores == animal[widget.index].animalalpha.length) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
              return AnswerAnimal(
                  index: widget.index,
                  scores: _totalScores(),
                  status: true);
            }),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
              return AnswerAnimal(
                  index: widget.index,
                  scores: widget.totalScore,
                  status: false);
            }),
          );
        }
      } else if (scores == animal[widget.index].animalalpha.length) {
        t.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return AnswerAnimal(
                index: widget.index,
                scores: _totalScores(),
                status: true);
          }),
        );
      } else if (time == -1) {
        t.cancel();
      }
      setState(() {
        time = time - 1;
      });
    });
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('ALERT!',
                style: TextStyle(fontSize: 30, color: Colors.black)),
            content: new Text('Are you sure to quit the game?'),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    time = -1;
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) {
                      return MainPage();
                    }));
                  },
                  child: new Text('Yes',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          fontWeight: FontWeight.bold))),
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text('No',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)))
            ],
          );
        });
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal'),
        backgroundColor: Colors.red[300],
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _showAlertDialog();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(2.0),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/animalasset/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('Timer : $time',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Container(width: 150),
                  Text('${widget.index + 1}/6',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(height: 20),
            Image.asset(animal[widget.index].imagehide, height: 200),
            Container(height: 20),
            GestureDetector(
              onTap: () => player.play(animal[widget.index].audio),
              child: Image.asset('assets/animalasset/clickme.png', height: 70),
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: animal[widget.index].animalalpha.keys
                  .map((i) => buildDragTarget(i))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: animal[widget.index].animalalpha.keys
                  .map((i) => DragObject(
                      image: animal[widget.index].animalalpha[i],
                      height: animalDB[widget.index].height,
                      score: score[i],
                      data: i))
                  .toList()
                    ..shuffle(Random(random)),
            ),
          ],
        ),
      ),
    );
  }

  DragTarget<String> buildDragTarget(i) {
    return DragTarget(
      builder: (context, List<String> data, rejected) {
        return score[i] == true
            ? Image.asset(animal[widget.index].animalalpha[i],
                height: animalDB[widget.index].height)
            : Image.asset('assets/animalasset/box.png',
                height: animalDB[widget.index].height);
      },
      onWillAccept: (data) => data == i,
      onAccept: (data) {
        setState(() {
          score[i] = true;
          scores++;
        });
      },
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


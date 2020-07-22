import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqidss/animal/model/animaldata.dart';
import '../../mainpage.dart';
import 'answeranimal.dart';
import 'dragobject.dart';

class AnimalQuiz extends StatefulWidget {
  final int index;
  final int totalScore;
  final List<AnimalData> list;

  AnimalQuiz(this.index, this.totalScore, this.list);
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

  void initState() {
    super.initState();
    startAnimalScreen();
    animalAudio();
  }

  int _totalScores() {
    return widget.totalScore + 1;
  }

  animalAudio() {
    player.play(widget.list[widget.index].audio);
  }

  startAnimalScreen() async {
    Timer.periodic(Duration(seconds: 1), (t) {
      if (time == 0) {
        t.cancel();
        // AnswerAnimal({this.image, this.animal, this.status, this.color, this.audio});
        if (scores == widget.list[widget.index].animalalpha.length) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
              return AnswerAnimal(
                  index: widget.index,
                  scores: _totalScores(),
                  status: true,
                  list: widget.list);
            }),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
              return AnswerAnimal(
                  index: widget.index,
                  scores: widget.totalScore,
                  status: false,
                  list: widget.list);
            }),
          );
        }
      } else if (scores == widget.list[widget.index].animalalpha.length) {
        t.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return AnswerAnimal(
                index: widget.index,
                scores: _totalScores(),
                status: true,
                list: widget.list);
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

  @override
  Widget build(BuildContext context) {
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
            Image.asset(widget.list[widget.index].imagehide, height: 200),
            Container(height: 20),
            GestureDetector(
              onTap: () => player.play(widget.list[widget.index].audio),
              child: Image.asset('assets/animalasset/clickme.png', height: 70),
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.list[widget.index].animalalpha.keys
                  .map((i) => buildDragTarget(i))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.list[widget.index].animalalpha.keys
                  .map((i) => DragObject(
                      image: widget.list[widget.index].animalalpha[i],
                      height: widget.list[widget.index].height,
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
            ? Image.asset(widget.list[widget.index].animalalpha[i],
                height: widget.list[widget.index].height)
            : Image.asset('assets/animalasset/box.png',
                height: widget.list[widget.index].height);
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
}

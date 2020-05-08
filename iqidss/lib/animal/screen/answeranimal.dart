import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:iqidss/animal/model/animal.dart';
import 'package:iqidss/animal/model/animaldata.dart';
import '../../mainpage.dart';
import 'animalquiz.dart';
import 'animalscore.dart';

class AnswerAnimal extends StatefulWidget {
  final int index;
  final int scores;
  final bool status;
  final String name;
  final List<AnimalData> list;

  AnswerAnimal({this.index, this.scores, this.status, this.list, this.name});
  @override
  _AnswerAnimalState createState() => _AnswerAnimalState();
}

class _AnswerAnimalState extends State<AnswerAnimal> {
  int time = 3;

  AudioCache player = AudioCache();

  void initState() {
    super.initState();

    if (widget.status == true) {
      animalAudio('animalasset/Congrates.mp3');
      showOverlay(context, 'assets/animalasset/congrates.gif');
    } else {
      animalAudio('animalasset/Timeup.mp3');
      showOverlay(context, 'assets/animalasset/timeup.gif');
    }
  }

  showOverlay(BuildContext context, images) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Container(
        height: double.infinity,
        child: Center(
          child: Image.asset(images, height: 400),
        ),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.transparent),
          color: new Color.fromRGBO(0, 0, 0, 0.5),
        ),
      ),
    );

    Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        if (time > 1) {
          time = time - 1;
          overlayState.insert(overlayEntry);
        } else {
          t.cancel();
          overlayEntry.remove();
        }
      });
    });
  }

  animalAudio(audio) {
    player.play(audio);
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
                  onPressed: () => Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return MainPage(widget.name);
                      })),
                  child: new Text('Yes',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          fontWeight: FontWeight.bold))),
              new FlatButton(
                  onPressed: () { Navigator.pop(context); },
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
    var column = Column(
      children: <Widget>[
        Container(height: 20),
        Image.asset(widget.list[widget.index].image, height: 250),
        Container(height: 20),
        Text(widget.list[widget.index].name,
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        Container(height: 20),
        widget.status == true
            ? Text('Correct!',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.green,
                    fontWeight: FontWeight.bold))
            : Text("Time's Up",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
        Container(height: 20),
        // Text('${widget.scores}',style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: RaisedButton(
            color: Colors.purple[300],
            textColor: Colors.white,
            padding: const EdgeInsets.all(15.0),
            child: Text("Next", style: TextStyle(fontSize: 25)),
            onPressed: () {
              if (widget.index == animal.length - 1) {
                return Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) {
                    return AnimalScore(score: widget.scores, name: widget.name);
                  }),
                );
              }
              return Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AnimalQuiz(widget.index + 1,
                        widget.scores, widget.list, widget.name)),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
      ],
    );
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
        padding: const EdgeInsets.all(20.0),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/animalasset/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: column,
      ),
    );
  }
}

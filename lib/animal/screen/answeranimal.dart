import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:iqidss/animal/model/animaldata.dart';
import 'package:iqidss/animal/model/animaldataglobal.dart';
import 'package:iqidss/animal/model/animaldbdata.dart';
import 'package:iqidss/animal/service/animal_data_service.dart';
import '../../mainpage.dart';
import 'animalquiz.dart';
import 'animalscore.dart';

class AnswerAnimal extends StatefulWidget {
  final int index;
  final int scores;
  final bool status;

  AnswerAnimal({this.index, this.scores, this.status});
  @override
  _AnswerAnimalState createState() => _AnswerAnimalState();
}

class _AnswerAnimalState extends State<AnswerAnimal> {
  int time = 3;
  AudioCache player = AudioCache();

  List<AnimalData> animal = globalAnimalsList;

  //firebase
  List<AnimalDBData> animalDB = new List<AnimalDBData>();
  final dataService = AnimalDataService();
  Future<List<AnimalDBData>> _futureData;

  void initState() {
    super.initState();

     _futureData = dataService.getAnimalList();

    if (widget.status == true) {
      animalAudio('animalasset/Congrates.mp3');
      showOverlay(context, 'assets/animalasset/congrates.gif');
    } else {
      animalAudio('animalasset/Timeup.mp3');
      showOverlay(context, 'assets/animalasset/timeup.gif');
    }
  }

  
   @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimalDBData>>(
        future: _futureData,
        builder: (context, snapshot) {
          animalDB = snapshot.data;
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data.length; i++) {
              animalDB[i].name = snapshot.data[i].name;
              animalDB[i].height = snapshot.data[i].height;              
            }
            return _buildMainScreen(context);
          } else
            return _buildFetchingDataScreen();
        });
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
                        return MainPage();
                      })),
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

 
  Scaffold _buildMainScreen(BuildContext context) {
    var column = Column(
      children: <Widget>[
        Container(height: 20),
        Image.asset(animal[widget.index].image, height: 200),
        Container(height: 20),
        Text(animalDB[widget.index].name,
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
              if (widget.index == animal.length -1) {
                return Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) {
                    return AnimalScore(score: widget.scores);
                  }),
                );
              }
              return Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AnimalQuiz(
                        widget.index + 1, widget.scores)),
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

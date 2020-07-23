import 'package:flutter/material.dart';
import 'package:iqidss/mainpage.dart';
import 'animalquiz.dart';

class AnimalGuide extends StatefulWidget {
  @override
  _AnimalGuideState createState() => _AnimalGuideState();
}

class _AnimalGuideState extends State<AnimalGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/animalasset/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Text("Listen to the audio and drag the answer",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 40),
            Image.asset('assets/animalasset/instruc.gif', height: 300),
            SizedBox(height: 30),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.purple[300],
                textColor: Colors.white,
                padding: const EdgeInsets.all(15.0),
                child: Text("Start", style: TextStyle(fontSize: 25)),
                onPressed: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimalQuiz(0, 0)),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
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
    );
  }
}

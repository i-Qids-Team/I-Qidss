import 'package:flutter/material.dart';
import 'package:iqidss/Shape/Model/Question.dart';
import 'package:iqidss/Shape/Model/Shape_Data.dart';
import 'package:iqidss/mainpage.dart';

import 'Shape_Score.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePage createState() => _GamePage();
}

class _GamePage extends State<GamePage> {
  List<Question> _questions = new List<Question>();

  int index = 0;
  int correct = 0, incorrect = 0, points = 0;

  void initState() {
    super.initState();

    _questions = getQuestion();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Lets play Shape!'),
            backgroundColor: Colors.red[300],
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  })
            ]),
        body: Container(
            padding: const EdgeInsets.all(10.0),
            height: double.infinity,
            color: Colors.red[100],
            child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "${index + 1}/${_questions.length}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Question",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Text(
                          "$points",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Points",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ])),
              Divider(color: Colors.black),
              SizedBox(
                height: 20,
              ),
              Text(
                "${_questions[index].getQuestion()}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              SizedBox(
                height: 200,
                child: Center(
                  child: Image.asset(_questions[index].getPicture()),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (_questions[index].getAnswer() == "True") {
                            setState(() {
                              points = points + 1;
                              index++;
                              correct++;
                            });
                          } else if (index == 3) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShapeScore(
                                          score: points,
                                          totalQuestion: _questions.length,
                                          correct: correct,
                                          incorrect: incorrect,
                                        )));
                          } else {
                            index++;
                            incorrect++;
                          }
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "True",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.green),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (_questions[index].getAnswer() == "False") {
                            setState(() {
                              points = points + 1;
                              index++;
                              incorrect++;
                            });
                          } else if (index == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShapeScore(
                                          score: points,
                                          totalQuestion: _questions.length,
                                          correct: correct,
                                          incorrect: incorrect,
                                        )));
                          } else {
                            index++;
                            correct++;
                          }
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "False",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}

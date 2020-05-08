import 'package:flutter/material.dart';
import 'package:iqidss/vegetable/model/vegetableData.dart';
import 'package:iqidss/vegetable/screen/vegetable_score.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

VegetableData questData = new VegetableData();

class VegetableScreen extends StatefulWidget {

  @override
  _VegetableScreenState createState() => _VegetableScreenState();
}

class _VegetableScreenState extends State<VegetableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetables'),
        backgroundColor: Colors.redAccent[100],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: VegetableScreenPage(),
        ),
      ),
    );
  }
}

class VegetableScreenPage extends StatefulWidget {

  @override
  _VegetableScreenPageState createState() => _VegetableScreenPageState();
}

class _VegetableScreenPageState extends State<VegetableScreenPage> {

  int totalCorrect = 0;
  int totalQuestion = 0;
  int indexAnsw = 0;
  String compliments = '';

  void checkAnswer(value) {
    if (questData.getAnswer() == value) {
      print('Correct');
      
      totalCorrect = totalCorrect + 1;
    } else {
      print('Wrong');
     
    }

    // questData.printQuestionLength();
    if (totalCorrect < 3) {
      compliments = 'Needs Improvement';
    } else {
      compliments = 'Excellent';
    }
    totalQuestion++; //

    //check if the question is finish
    if (questData.questFinish() == true) {
      print('Question is Finish');
      int totalScore = totalCorrect;
      Alert(
          context: context,
          title: 'The Game is Over',
          // desc: 'Right $totalCorrect out of $totalQuestion',
          buttons: [
            DialogButton(
                child: Text('Score'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VegetableScore(
                                score: totalScore,
                                totalQuestion: questData.printQuestionLength(),
                                compliments: compliments,
                              )));
                })
          ]).show();

      questData.questReset(); //to reset question
      
      totalCorrect = 0;
      totalQuestion = 0;

      print(totalCorrect); //to check/test quantity of correct
      print(totalQuestion); //to check.test total question
    } else {
      //to go to next question
      questData.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/vegefruitbg.gif'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(height: 20.0),
              ],
            ),
            Expanded(
              flex: 1,
              child: Card(
                color: const Color(0xFFFCE4EC),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    // 'Question is here',
                    questData.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                )),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.red[50],
                        width: 5,
                      )),
                  child: Center(
                    child: Image.asset(
                      // 'Picture is here',
                      questData.getImage(),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // First Column in Row
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red[100], width: 5.0),
                    ),
                    textColor: Colors.white,
                    color: Colors.red[50],
                    child: Text(
                      // 'True',
                      questData.getFirstChoice(),
                      style: TextStyle(fontSize: 25.0, color: Colors.red),
                    ),
                    onPressed: () {
                      // print('pressed');
                      // checkAnswer(true);
                      setState(() {
                        checkAnswer(1);
                      });
                    },
                  ),
                )),
                // Second Column in Row
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red[100], width: 5.0),
                    ),
                    
                    color: Colors.red[50],
                    child: Text(
                      // 'False',
                      questData.getSecondChoice(),
                      style: TextStyle(fontSize: 25.0, color: Colors.red),
                    ),
                    onPressed: () {
                      // print('pressed');
                      // checkAnswer(false);
                      setState(() {
                        checkAnswer(2);
                      });
                    },
                  ),
                )),
              ],
            )),
          ]),
    );
  }
}

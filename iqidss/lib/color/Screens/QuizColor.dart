import 'package:flutter/material.dart';
import 'package:iqidss/color/Models/Data.dart';
import 'package:iqidss/color/Models/QuestionModel.dart';
import 'package:iqidss/color/Screens/ResultColor.dart';
import 'package:cached_network_image/cached_network_image.dart';

class QuizColor extends StatefulWidget {
  final String _name;
  QuizColor(this._name);
  @override
  _QuizColorState createState() => _QuizColorState();
}

class _QuizColorState extends State<QuizColor> 
with SingleTickerProviderStateMixin{
  
  List<QuestionModel> _questions = new List<QuestionModel>();

  int index = 0;
  int correct = 0, incorrect = 0, notAttempted = 0, points = 0;
  
  double beginAnim = 0.0;
  double endAnim = 1.0;

  Animation animation;
  AnimationController animationController;

  @override
  void initState() { 
    super.initState();

    _questions = getQuestion();

    animationController = AnimationController(duration: const Duration(seconds: 5),
    vsync: this)
      ..addListener((){
        setState(() {});
      });

      animation = 
        Tween(begin: beginAnim, end: endAnim).animate
        (animationController);
        startAnim();

        animationController.addStatusListener((AnimationStatus status){
          if(status == AnimationStatus.completed){
            setState(() {
              if(index < _questions.length - 1){
                index++;
                resetAnim();
                startAnim();
                notAttempted++;
              }
              else{
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => ResultColor(
                    score: points,
                    totalQuestion: _questions.length,
                    correct: correct,
                    incorrect: incorrect,
                    notattempted: notAttempted,
                    name: widget._name,
                  )
                ));
              }
            });
          }
        }); 
  }

  startAnim(){
    animationController.forward();
  }

  resetAnim(){
    animationController.reset();
  }

  stopAnim(){
    animationController.stop();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red[300],         
      ),

      body: Container(               
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(          
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(                
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "${index + 1}/${_questions.length}",
                    style: TextStyle(color: Colors.white,   fontSize: 24, fontWeight: FontWeight.w500),
                    ),                  
                  SizedBox(
                    width: 8,
                  ),

                  Text(
                    "Question",
                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),
                    ),                  
                 Spacer(),

                  Text(
                    "$points",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
                    ),                  
                  SizedBox(
                    width: 8,
                  ),

                  Text(
                    "Points",
                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),
                    )
                ],
              ),
            ),
          Divider(color: Colors.black),
          SizedBox(
            height: 20,
          ),
          
          Text(
            "${_questions[index].getQuestion()}?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          SizedBox(
            height: 20,
          ),

          LinearProgressIndicator(
            value: animation.value,
          ),

          CachedNetworkImage(imageUrl: _questions[index].getImageUrl(),),

          Spacer(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      if(_questions[index].getAnswer() == "True"){
                        setState(() {
                          points = points + 1;
                          index++;
                          correct++;
                          resetAnim();
                          startAnim();
                        });
                      }

                      else{                
                        index++;
                        incorrect++;
                        resetAnim();
                        startAnim();
                      }
                    },

                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
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
                    onTap: (){
                      if(_questions[index].getAnswer() == "False")
                      {
                        setState(() {
                          points = points + 1;
                          index++;
                          correct++;
                          resetAnim();
                          startAnim();
                        });
                      }

                      else{
                        
                        index++;
                        incorrect++;
                        resetAnim();
                        startAnim();
                      }
                    },
                      child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.red
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.black),
          ],
        ),
      ),
    );
  }
}

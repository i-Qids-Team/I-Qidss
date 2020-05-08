import 'Question.dart';

class MockData{

  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('assets/square.png','Square have 4 edges ?', true),
    Question('assets/circle.png','Circle have 10 edges ?', false),
    Question('assets/triangle.png','Triangle is a pizza.', true),
    Question('assets/cylinder.png','Cylinder is circle.', false),
  ];

  void nextQuestion(){
    if(_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
    else {

    }
  }

  String getImage(){
    return _questionBank[_questionNumber].picture;
  }
  
  String getQuestion(){
    return _questionBank[_questionNumber].question;
  }

  bool getCorrectAnswer(){
    return _questionBank[_questionNumber].answer;
  }
  
  bool lastQuestion(){
    if (_questionNumber == _questionBank.length-1)
      return true;
    else
      return false;
  }

}



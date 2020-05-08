import 'package:iqidss/vegetables/model/vegetable_model.dart';

class VegetableData {
  int _questionNumber = 0;

  List<VegetableQuestion> _question = [
    VegetableQuestion('1/5) I look like a tree', 'assets/broccoli.gif',
        'Pickles', 'Broccoli', 2),
    VegetableQuestion('2/5) I am long and purple. Who am I?',
        'assets/eggplant2.gif', 'Eggplant', 'Pineapple', 1),
    VegetableQuestion('3/5) I have a big seed. Who am I?', 'assets/avocado.gif',
        'Broccoli', 'Avocado', 2),
    VegetableQuestion('4/5) People cry when they cut me. Who am I?',
        'assets/onion.gif', 'Onion', 'Mushroom', 1),
    VegetableQuestion('5/5) You use me in salad. Who am I?',
        'assets/carrot2.gif', 'Manggo', 'Carrot', 2),
  ];

  static get assets => null;

  String getQuestion() {
    return _question[_questionNumber].questionString;
  }

  String getFirstChoice() {
    return _question[_questionNumber].firstChoice;
  }

  String getSecondChoice() {
    return _question[_questionNumber].secondChoice;
  }

  String getImage() {
    return _question[_questionNumber].assetImage;
  }

  bool questFinish() {
    if (_questionNumber == _question.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void questReset() {
    _questionNumber = 0;
  }

  int printQuestionLength() {
    return _question.length;
  }

  int getAnswer() {
    return _question[_questionNumber].questionAnswer;
  }

  //go next question in the list
  void nextQuestion() {
    if (_questionNumber <= _question.length - 1) {
      _questionNumber++;
    }
  }
}

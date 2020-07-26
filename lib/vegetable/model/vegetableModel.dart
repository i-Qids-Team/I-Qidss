class VegetableModel {
  String vegeId;
  String question;
  String firstChoice;
  String secondChoice;
  int answerScheme;

  String assetImage;

  VegetableModel(
      {this.vegeId,
      this.question,
      this.assetImage,
      this.firstChoice,
      this.secondChoice,
      this.answerScheme});

  VegetableModel.fromJson(Map<String, dynamic> json)
      : this(
            vegeId: json['vegeId'],
            question: json['question'],
            assetImage: json['assetImage'],
            firstChoice: json['firstChoice'],
            secondChoice: json['secondChoice'],
            answerScheme: json['answerScheme']);

  Map<String, dynamic> toJson() => {
        'vegeId': vegeId,
        'question': question,
        'assetImage': assetImage,
        'firstChoice': firstChoice,
        'secondChoice': secondChoice,
        'answerScheme': answerScheme
      };

  // void setQuestion(String _question) {
  //   question = _question;
  // }

  // void setAnswer(int getAnswer) {
  //   answerScheme = getAnswer;
  // }

  //   String getQuestion() {
  //   return _question[_questionNumber].question;
  // }

  // String getFirstChoice() {
  //   return _question[_questionNumber].firstChoice;
  // }

  // String getSecondChoice() {
  //   return _question[_questionNumber].secondChoice;
  // }

  // String getImage() {
  //   return _question[_questionNumber].assetImage;
  // }

  // bool questFinish() {
  //   if (_questionNumber == _question.length - 1) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // void questReset() {
  //   _questionNumber = 0;
  // }

  // int printQuestionLength() {
  //   return _question.length;
  // }

  // int getAnswer() {
  //   return _question[_questionNumber].answerScheme;
  // }

  // //go next question in the list
  // void nextQuestion() {
  //   if (_questionNumber <= _question.length - 1) {
  //     _questionNumber++;
  //   }
  // }
}

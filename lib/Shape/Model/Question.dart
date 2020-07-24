class Question{

  String question;
  String answer;
  String picture;

  Question({this.question, this.answer, this.picture});

  Question.fromJson(Map<String, dynamic> json)
      : this(
            question: json['question'].toString(),
            answer: json['answer'],
            picture: json['picture']);

  Map<String, dynamic> toJson() =>
      {'question': question, 'answer': answer, 'picture': picture};

  void setQuestion(String getQuestion){
    question = getQuestion;
  }

  void setAnswer(String getAnswer){
    answer = getAnswer;
  }

  void setPicture(String getPicture){
    picture = getPicture;
  }

  String getQuestion(){
    return question;
  }

  String getAnswer(){
    return answer;
  }

  String getPicture(){
    return picture;
  } 

  }

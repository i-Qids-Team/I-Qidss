import 'Question.dart';

List<Question> getQuestion(){

  List<Question> questions = new List<Question>();
  Question question = new Question();

  //Question 1
  question.setQuestion("Square have 4 edges ? ");
  question.setAnswer("True");
  question.setPicture("assets/square.png");
  questions.add(question);

  question = new Question();

  //Question 2
  question.setQuestion("Circle have 10 edges ?");
  question.setAnswer("False");
  question.setPicture("assets/circle.png");
  questions.add(question);

  question = new Question();

  //Question 3
  question.setQuestion("Triangle has 3 edges ?");
  question.setAnswer("True");
  question.setPicture("assets/triangle.png");
  questions.add(question);

  question = new Question();

  //Question 4
  question.setQuestion("Cylinder has 2 edges ?");
  question.setAnswer("False");
  question.setPicture("assets/cylinder.png");
  questions.add(question);

  question = new Question();

   return questions;
}



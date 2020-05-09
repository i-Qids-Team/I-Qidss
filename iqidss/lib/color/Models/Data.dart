import 'package:iqidss/color/Models/QuestionModel.dart';

List<QuestionModel> getQuestion(){

  List<QuestionModel> questions = new List<QuestionModel>();
  QuestionModel questionModel = new QuestionModel();

  //Question 1
  questionModel.setQuestion("Is a tiger orange?");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("https://4.bp.blogspot.com/-CDWC0kIUyvU/Wyki1CAb0TI/AAAAAAAgYYQ/nuC6FFFWIkM_WMq4zmcmsuP546Y5AcInQCLcBGAs/s1600/AW1237953_05.gif");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //Question 2
  questionModel.setQuestion("Is a dolphin blue?");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("https://i.pinimg.com/originals/5c/92/70/5c927090eb8e055873c90a01365f7107.gif");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //Question 3
  questionModel.setQuestion("Is a caterpillar yellow?");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("https://gifimage.net/wp-content/uploads/2018/06/transparent-animated-gif-1.gif");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //Question 4
  questionModel.setQuestion("Is a bird black?");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("https://i.gifer.com/ZHug.gif");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //Question 5
  questionModel.setQuestion("Is a duck yellow?");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("https://media0.giphy.com/media/63MTnAuYB6DxZ1J3Aq/source.gif");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //Question 6
  questionModel.setQuestion("Is an octopus pink?");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("https://media.giphy.com/media/6U9oZb44dg2Uo/giphy.gif");
  questions.add(questionModel);

  questionModel = new QuestionModel(); 

  return questions;
}
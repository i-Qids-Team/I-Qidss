//Do not use the vegetableData.dart for the backend

// import 'package:iqidss/vegetable/model/vegetableModel.dart';

// class VegetableData {
//   int _questionNumber = 0;

//   List<VegetableModel> _question = [
//     // VegetableModel('m', '1/5) I look like a tree', 'assets/broccoli.gif',
//     // 'Pickles', 'Broccoli', 2),

//     VegetableModel(
//         question: '1/5) I look like a tree',
//         assetImage: 'assets/broccoli.gif',
//         firstChoice: 'Pickles',
//         secondChoice: 'Broccoli',
//         answerScheme: 2),
//     VegetableModel(
//         question: '2/5) I am long and purple. Who am I?',
//         assetImage: 'assets/eggplant2.gif',
//         firstChoice: 'Eggplant',
//         secondChoice: 'Pineapple',
//         answerScheme: 1),
//     VegetableModel(
//         question: '3/5) I have a big seed. Who am I?',
//         assetImage: 'assets/avocado.gif',
//         firstChoice: 'Broccoli',
//         secondChoice: 'Avocado',
//         answerScheme: 2),
//     VegetableModel(
//         question: '4/5) People cry when they cut me. Who am I?',
//         assetImage: 'assets/onion.gif',
//         firstChoice: 'Onion',
//         secondChoice: 'Mushroom',
//         answerScheme: 1),
//     VegetableModel(
//         question: '5/5) You use me in salad. Who am I?',
//         assetImage: 'assets/carrot2.gif',
//         firstChoice: 'Manggo',
//         secondChoice: 'Carrot',
//         answerScheme: 2),
//   ];

//   static get assets => null;

//   String getQuestion() {
//     return _question[_questionNumber].question;
//   }

//   String getFirstChoice() {
//     return _question[_questionNumber].firstChoice;
//   }

//   String getSecondChoice() {
//     return _question[_questionNumber].secondChoice;
//   }

//   String getImage() {
//     return _question[_questionNumber].assetImage;
//   }

//   bool questFinish() {
//     if (_questionNumber == _question.length - 1) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   void questReset() {
//     _questionNumber = 0;
//   }

//   int printQuestionLength() {
//     return _question.length;
//   }

//   int getAnswer() {
//     return _question[_questionNumber].answerScheme;
//   }

//   //go next question in the list
//   void nextQuestion() {
//     if (_questionNumber <= _question.length - 1) {
//       _questionNumber++;
//     }
//   }
// }

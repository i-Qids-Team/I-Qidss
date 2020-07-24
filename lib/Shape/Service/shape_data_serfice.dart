import 'package:iqidss/Shape/Model/Question.dart';

import './rest_service.dart';

class ShapeDataService {
  static final ShapeDataService _instance = ShapeDataService._constructor();
  factory ShapeDataService() {
    return _instance;
  }

  ShapeDataService._constructor();
  final rest = RestService();

  Future<List<Question>> getAllQuestion() async {
    final listJson = await rest.get('shape');

    return (listJson as List)
        .map((itemJson) => Question.fromJson(itemJson))
        .toList();
  }

  Future<Question> getQuestionById({String id}) async {
    final json = await rest.get('shape/$id');
    return Question.fromJson(json);
  }

  Future<Question> answerTrue({String id, int answer}) async {
    final json = await rest.patch('shape/$id', data: {'answer': true});
    return Question.fromJson(json);
  }

    Future<Question> answerFalse({String id, int answer}) async {
    final json = await rest.patch('shape/$id', data: {'answer': false});
    return Question.fromJson(json);
  }

  Future<Question> updateQuestion({String id}) async {
    final json = await rest.patch('shape/$id',
        data: {'question': 'Always do your best. What you plant now, you will harvest later.'});
    return Question.fromJson(json);
  }


} 

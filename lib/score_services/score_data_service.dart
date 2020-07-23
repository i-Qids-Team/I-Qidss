


// QuoteDataService is a wrapper class implmenting calls for CRUD operations on Quote endpoints.
//  The class is implemented using the Singleton design pattern.

// TODO: Modify this class accordingly. You want to add all CRUD operations that your app uses.
// Example: get the list of quotes, get a quote for given id, update the like / dislike
//     You may want to refer the past project flutter_todo_rest, you can clone from github:
//         $ git clone https://github.com/jumail-utm/flutter_todo_rest.git


import 'package:iqidss/score_models/score.dart';

import 'data_service.dart';

class ScoreDataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final ScoreDataService _instance = ScoreDataService._constructor();
  factory ScoreDataService() {
    return _instance;
  }

  ScoreDataService._constructor();
  final rest = DataService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all quotes and 2). to delete a quote
  //  are given for examples to guide you writing the other REST calls.

   Future<List<Score>> getScoreList() async {
    final listJson = await rest.get('scores');

    return (listJson as List)
        .map((itemJson) => Score.fromJson(itemJson))
        .toList();
  }

   Future<Score> updateScore({String id, int score}) async {
    final json = await rest.patch('scores/$id', data: {'score': score});

    return Score.fromJson(json);
  }

  Future<Score> createScore({Score score}) async {
    final json = await rest.post('scores/', data: score);

    return Score.fromJson(json);
  }

  Future<Score> deleteScore({String id}) async {
    final json = await rest.delete('scores/$id');

    return Score.fromJson(json);
  }

} // class Quote

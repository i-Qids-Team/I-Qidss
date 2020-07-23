class Score {
  String id;
  int score;

  Score({this.id,this.score});

  Score.fromJson(Map<String, dynamic> json) : this(
    id: json['id'].toString(),
    score: json['score']    
    );

  Map<String, dynamic> toJson() => {
    'id': id,
    'score': score
    };
}

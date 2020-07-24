class ColorDBData {
  // String id;
  String question;
  String imageURL;
  String answer;

  ColorDBData({this.question, this.imageURL, this.answer});

  ColorDBData.fromJson(Map<String, dynamic> json)
      : this(
            question: json['question'],
            imageURL: json['imageURL'],
            answer: json['answer']);

  Map<String, dynamic> toJson() =>
      {'question': question, 'imageURL': imageURL, 'answer': answer};
}

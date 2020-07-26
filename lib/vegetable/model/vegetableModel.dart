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
}

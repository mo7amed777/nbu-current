import 'dart:convert';

class SurveyQuestion {
  late String questionID;
  late String score;
  late String titleEN, titleAR;
  late String questionTypeID;
  late List answers;
  SurveyQuestion({
    required this.questionID,
    required this.score,
    required this.titleEN,
    required this.titleAR,
    required this.questionTypeID,
    required this.answers,
  });
  SurveyQuestion.fromJson(Map<String, dynamic> json) {
    questionID = json['id'].toString();
    score = json['score'].toString();
    titleEN = json['titleEn'];
    titleAR = json['titleAr'];
    questionTypeID = json['questionTypeId'].toString();
    answers = json['surveyQuestionAnswers'];
  }
}

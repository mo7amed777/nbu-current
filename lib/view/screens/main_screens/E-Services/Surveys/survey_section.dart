import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SurveySection {
  late String id;
  late String name;
  late String description;
  late List questions;
  SurveySection({
    required this.id,
    required this.name,
    required this.description,
    required this.questions,
  });
  SurveySection.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = Get.locale == Locale('en') ? json['nameEn'] : json['nameAr'];
    description = json['description'] ?? '';
    questions = json['question'];
  }
}

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
    answers = json['SurveySectionAnswers'];
  }
}

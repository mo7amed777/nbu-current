import 'dart:convert';

import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/Surveys/survey_question.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/Surveys/questions_of_servey.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/view/widgets/expandTile.dart';
import 'package:http/http.dart' as http;

class Surveys extends StatefulWidget {
  const Surveys({required this.surveys});
  final List surveys;
  @override
  State<Surveys> createState() => _SurveysState();
}

class _SurveysState extends State<Surveys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
            child: Appbar(
              title: 'surveys',
              search: Icons.search,
              onSearch: (val) {},
            ),
          ),
          Expanded(
            child: ListView(
                children: widget.surveys.map((survey) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpandedTile(
                  //trailing: Icon(Icons.arrow_forward_ios),
                  mainTitle: survey['surveyPeriod']['survey']['surveyName'],
                  title: survey['surveyPeriod']['survey']['surveyDescription'],
                  TwoItemsRow: [
                    survey['surveyPeriod']['startDate'],
                    survey['surveyPeriod']['endDate'],
                  ],
                  onTap: () async {
                    getSurveyQuestionsByID(
                      surveyID: survey['surveyPeriod']['surveyId'].toString(),
                      surveyName: survey['surveyPeriod']['survey']
                          ['surveyName'],
                      surveyPeriodID: survey['surveyPeriodId'],
                      surveyPeriodTargetUserId: survey['id'],
                    );
                  },
                ),
              );
            }).toList()),
          ),
        ],
      ),
    );
  }

  void getSurveyQuestionsByID(
      {required String surveyID,
      required String surveyName,
      required int surveyPeriodID,
      required surveyPeriodTargetUserId}) async {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    final http.Response response = await http.get(
        Uri.parse("http://10.220.17.59/API/NBUSurvey/GetQuestion/$surveyID"));
    List surveyQuestions = jsonDecode(response.body);
    List<SurveyQuestion> questions = [];
    for (var question in surveyQuestions) {
      questions.add(SurveyQuestion.fromJson(question));
    }
    Get.back();
    Get.to(QuestionsOfServey(
      surveyQuestions: questions,
      surveyID: int.parse(surveyID),
      surveyName: surveyName,
      surveyPeriodID: surveyPeriodID,
      surveyPeriodTargetUserId: surveyPeriodTargetUserId,
    ));
  }
}

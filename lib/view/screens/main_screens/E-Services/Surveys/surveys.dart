import 'dart:convert';

import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/Surveys/survey_section.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/Surveys/sections_of_servey.dart';
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
      backgroundColor:
          widget.surveys.isEmpty ? Color(0xFFFEEFDA) : AppTheme.background,
      body: Column(
        children: [
          widget.surveys.isEmpty
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 6),
                  child: Appbar(
                    title: 'Surveys',
                    search: Icons.search,
                    onSearch: (val) {},
                  ),
                ),
          Expanded(
            child: widget.surveys.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/media/no_survey.jpg'),
                      ),
                      SizedBox(height: 32),
                      Text(
                        'No Surveys Available !',
                        style: TextStyle(
                          color: AppTheme.nearlyBlack,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  )
                : ListView(
                    children: widget.surveys.map((survey) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpandedTile(
                        //trailing: Icon(Icons.arrow_forward_ios),
                        mainTitle: survey['survey']['surveyName'],
                        title: survey['survey']['surveyDescription'],
                        TwoItemsRow: [
                          survey['startDate'],
                          survey['endDate'],
                        ],
                        onTap: () async {
                          getSurveyQuestionsByID(
                            surveyID: survey['surveyId'].toString(),
                            surveyName: survey['survey']['surveyName'],
                            surveyDescription: survey['survey']
                                ['surveyDescription'],
                            surveyPeriodID: survey['id'],
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

  void getSurveyQuestionsByID({
    required String surveyID,
    required String surveyName,
    required String surveyDescription,
    required int surveyPeriodID,
  }) async {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    final http.Response response = await http.get(Uri.parse(
        "http://10.220.17.59/API/NBUSurvey/GetSurvey?surveyId=$surveyID&PeriodId=$surveyPeriodID"));
    dynamic surveyBody = jsonDecode(response.body);
    List surveySections = surveyBody['sections'];
    List<SurveySection> sections = [];
    for (var section in surveySections) {
      sections.add(SurveySection.fromJson(section));
    }
    Get.back();
    Get.to(() => SectionsOfServey(
          surveySections: sections,
          surveyID: int.parse(surveyID),
          surveyName: surveyName,
          surveyDescription: surveyDescription,
          surveyPeriodID: surveyPeriodID,
        ));
  }
}

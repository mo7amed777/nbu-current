import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/controller/functions.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/Surveys/survey_question.dart';
import 'package:http/http.dart' as http;
import 'package:northern_border_university/view/widgets/my_button.dart';

// ignore: must_be_immutable
class QuestionsOfServey extends StatefulWidget {
  late List<SurveyQuestion> surveyQuestions;
  late int surveyID, surveyPeriodID, surveyPeriodTargetUserId;
  late String surveyName;
  QuestionsOfServey({
    required this.surveyQuestions,
    required this.surveyID,
    required this.surveyName,
    required this.surveyPeriodID,
    required this.surveyPeriodTargetUserId,
  });
  @override
  QuestionsOfServeyState createState() => QuestionsOfServeyState();
}

class QuestionsOfServeyState extends State<QuestionsOfServey> {
  List<TextEditingController> controllers =
      List.generate(10, (index) => TextEditingController());

  List<String> missedTitles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                    AppTheme.green,
                    AppTheme.nearlyBlack,
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                    AppTheme.green,
                    AppTheme.lightGreen,
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                    AppTheme.lightGreen,
                    AppTheme.lightText,
                  ])),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.app_registration_rounded,
                          color: AppTheme.white,
                          size: 50,
                        ),
                        Text(
                          widget.surveyName,
                          style: TextStyle(
                              color: AppTheme.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: widget.surveyQuestions.map(
                (surveyQuestion) {
                  switch (surveyQuestion.questionTypeID) {
                    case "1":
                      return buildQuestion(
                        title: surveyQuestion.titleEN,
                        isList: true,
                        answersWidget: checkBoxlist(
                            answers: surveyQuestion.answers,
                            questionID: int.parse(surveyQuestion.questionID)),
                      );
                    case "2":
                      return buildQuestion(
                        title: surveyQuestion.titleEN,
                        isList: true,
                        answersWidget: radioButtonlist(
                            answers: surveyQuestion.answers,
                            questionID: int.parse(surveyQuestion.questionID)),
                      );
                    case "3":
                      return buildQuestion(
                        title: surveyQuestion.titleEN,
                        isList: false,
                        answersWidget: TextFormField(
                          controller: controllers[
                              widget.surveyQuestions.indexOf(surveyQuestion)],
                          textInputAction: TextInputAction.done,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          onFieldSubmitted: (value) {
                            submit_answers.addAll({
                              int.parse(surveyQuestion.questionID): value,
                            });
                          },
                          decoration: InputDecoration(
                            label: Text('Your answer here..'),
                          ),
                        ),
                      );
                    case "4":
                      return buildQuestion(
                        title: surveyQuestion.titleEN,
                        isList: false,
                        answersWidget: dropDownlist(
                            answers: surveyQuestion.answers,
                            questionID: int.parse(surveyQuestion.questionID)),
                      );
                    default:
                      return Container();
                  }
                },
              ).toList()
                ..add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyButton(
                      callback: () {
                        //Every Answer is one except checkbox many answers
                        //Map<int QuestionID,dynamic answer>
                        //Example: {
                        // 1 : also one id if radio or dropdown
                        // 2 : string if input filed
                        // 3 : list of ids if checkbox
                        //}
                        print(submit_answers.keys); //Questions ids
                        print(submit_answers.values); // answers ids
                        validate(surveyQuestions: widget.surveyQuestions);
                      },
                      label: 'Submit'),
                )),
            ),
          ),
        ],
      ),
    );
  }

  void validate({required List<SurveyQuestion> surveyQuestions}) async {
    setState(() {
      missedTitles.clear();
    });
    if (surveyQuestions.length == submit_answers.keys.length) {
      for (int questionID in submit_answers.keys) {
        if (submit_answers[questionID] == null ||
            submit_answers[questionID] == '') {
          showSnackBar(message: 'You have to answer all Questions!', err: true);
          for (var question in surveyQuestions) {
            if (!missedTitles.contains(question.titleEN) &&
                int.parse(question.questionID) == questionID) {
              setState(() {
                missedTitles.add(question.titleEN);
              });
            }
            print(missedTitles);
          }
          return;
        } else {
          for (var question in surveyQuestions) {
            if (missedTitles.contains(question.titleEN) &&
                int.parse(question.questionID) == questionID) {
              setState(() {
                missedTitles.remove(question.titleEN);
              });
            }
          }
        }
      }
      //Post Survey Answers to API
      List body = [];
      submit_answers.forEach((questionID, answer) {
        if (answer is List) {
          for (var ans in answer) {
            body.add({
              "Id": 0, // const 0
              "SurveyId": widget.surveyID,
              "SurveyPeriodId": widget.surveyPeriodID,
              "SurveyPeriodTargetUserId":
                  widget.surveyPeriodTargetUserId, // first id in api
              "SurveyQuestionId": questionID,
              "AnswerValue": ans.toString(),
            });
          }
        } else {
          body.add({
            "Id": 0, // const 0
            "SurveyId": widget.surveyID,
            "SurveyPeriodId": widget.surveyPeriodID,
            "SurveyPeriodTargetUserId":
                widget.surveyPeriodTargetUserId, // first id in api
            "SurveyQuestionId": questionID,
            "AnswerValue": answer.toString(),
          });
        }
      });
      print('Post Body : $body');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final http.Response response = await http.post(
        Uri.parse("http://10.220.17.59/API/NBUSurvey/PostAnswer"),
        body: jsonEncode(body),
        headers: headers,
      );
      print(response.statusCode);
      if (jsonDecode(response.body)) {
        Get.back();
        showSnackBar(message: 'Submitted Successfully');
      } else {
        showSnackBar(message: 'Error while submitting survey!', err: true);
      }
    } else {
      showSnackBar(message: 'You have to answer all Questions!', err: true);
      for (var question in surveyQuestions) {
        if (!submit_answers.containsKey(int.parse(question.questionID))) {
          if (!missedTitles.contains(question.titleEN)) {
            setState(() {
              missedTitles.add(question.titleEN);
            });
          }
        }
      }
    }
  }

  Map<int, dynamic> submit_answers = {};
  String? dropDownAnswer;
  var ansr;
  Widget dropDownlist({required List answers, required int questionID}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        items: answers
            .map(
              (ans) => DropdownMenuItem<String>(
                value: ans['titleEn'],
                child: Text(
                  ans['titleEn'],
                ),
                onTap: () {
                  ansr = ans;
                },
              ),
            )
            .toList(),
        value: dropDownAnswer,
        hint: Text('Select one'),
        onChanged: (selectedAnswer) {
          setState(() {
            dropDownAnswer = selectedAnswer!;
          });
          submit_answers.addAll({
            questionID: answers[answers.indexOf(ansr)]['id'],
          });
        },
      ),
    );
  }

  List<int> answersID = [];
  List<bool> checkBoxAnswers = List.generate(10, (index) => false);
  List<Widget> checkBoxlist({required List answers, required int questionID}) {
    return answers
        .map(
          (answer) => CheckboxListTile(
            value: checkBoxAnswers[answers.indexOf(answer)],
            title: Text(answer['titleEn']),
            onChanged: (value) {
              if (value!) {
                if (!answersID.contains(answer['id'])) {
                  answersID.add(answer['id']);
                }
              } else {
                if (answersID.contains(answer['id'])) {
                  answersID.remove(answer['id']);
                }
              }
              setState(() {
                checkBoxAnswers[answers.indexOf(answer)] = value;
              });
              submit_answers.addAll({
                questionID: answersID.isEmpty ? null : answersID,
              });
            },
          ),
        )
        .toList();
  }

  String? radioAnswer;
  List<Widget> radioButtonlist(
      {required List answers, required int questionID}) {
    return answers
        .map(
          (answer) => RadioListTile<String>(
            value: answer['titleEn'],
            contentPadding: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero)),
            groupValue: radioAnswer,
            title: Text(answer['titleEn']),
            onChanged: (String? value) {
              setState(() {
                radioAnswer = value!;
              });
              submit_answers.addAll({
                questionID: answers[answers.indexOf(answer)]['id'],
              });
            },
          ),
        )
        .toList();
  }

  bool expanded = false;
  Widget buildQuestion({
    required String title,
    required answersWidget,
    required bool isList,
  }) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(expanded ? 0 : 30)),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
              color: missedTitles.contains(title)
                  ? Colors.red
                  : AppTheme.lightGreen),
        ),
        onExpansionChanged: ((value) {
          setState(() {
            expanded = value;
          });
        }),
        children: isList ? answersWidget : [answersWidget],
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

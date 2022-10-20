import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/controller/functions.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/Surveys/survey_section.dart';
import 'package:http/http.dart' as http;
import 'package:northern_border_university/view/widgets/my_button.dart';

// ignore: must_be_immutable
class SectionsOfServey extends StatefulWidget {
  late List<SurveySection> surveySections;
  late int surveyID, surveyPeriodID;
  late String surveyName, surveyDescription;
  final Map<String, dynamic> userData;
  SectionsOfServey({
    required this.surveySections,
    required this.surveyID,
    required this.surveyName,
    required this.surveyDescription,
    required this.surveyPeriodID,
    required this.userData,
  });
  @override
  SectionsOfServeyState createState() => SectionsOfServeyState();
}

class SectionsOfServeyState extends State<SectionsOfServey> {
  @override
  void initState() {
    super.initState();
    //answersID = [];
    submit_answers = {};
  }

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
            child: SingleChildScrollView(
              child: Column(
                children: widget.surveySections.map(
                  (surveySection) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildInnerWidget(surveySection),
                    );
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
                          validate(surveySections: widget.surveySections);
                        },
                        label: 'Submit'),
                  )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validate({required List<SurveySection> surveySections}) async {
    setState(() {
      missedTitles.clear();
    });
    int full_length = 0;
    for (var surveySection in surveySections) {
      full_length += surveySection.questions.length;
    }
    if (full_length == submit_answers.keys.length) {
      for (int questionID in submit_answers.keys) {
        if (submit_answers[questionID] == null ||
            submit_answers[questionID] == '') {
          showSnackBar(message: 'You have to answer all Questions!', err: true);
          for (var section in surveySections) {
            for (var question in section.questions) {
              if (!missedTitles.contains(question['title']) &&
                  question['id'] == questionID) {
                setState(() {
                  missedTitles.add(question['title']);
                });
              }
              print(missedTitles);
            }
            return;
          }
        } else {
          for (var section in surveySections) {
            for (var question in section.questions) {
              if (missedTitles.contains(question['title']) &&
                  question['id'] == questionID) {
                setState(() {
                  missedTitles.remove(question['title']);
                });
              }
            }
          }
        }
        List<Map<String, dynamic>> answers = [];
        //Post Survey Answers to API
        Map<String, dynamic> body = {
          "SurveyId": widget.surveyID,
          "SurveyPeriodId": widget.surveyPeriodID,
          "NID": widget.userData['NID'],
          'TargetTypeId': widget.userData['TargetTypeId'],
          'Gender': widget.userData['Gender'],
          'CollegeCode': widget.userData['CollegeCode'],
          'SectionCode': widget.userData['SectionCode'],
          "DeviceType": 2,
          "UserAnswerDVM": answers,
        };
        submit_answers.forEach((questionID, answer) {
          if (answer is List) {
            for (var ans in answer) {
              answers.add({
                "SurveyQuestionId": questionID,
                "AnswerValue": ans.toString(),
              });
            }
          } else {
            answers.add({
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
          return;
        } else {
          showSnackBar(message: 'Error while submitting survey!', err: true);
        }
      }
    } else {
      showSnackBar(message: 'You have to answer all Questions!', err: true);
      for (var section in surveySections) {
        for (var question in section.questions) {
          if (!submit_answers.containsKey(question['id'])) {
            if (!missedTitles.contains(question['title'])) {
              setState(() {
                missedTitles.add(question['title']);
              });
            }
          }
        }
      }
    }
  }

  String? dropDownAnswer;
  var ansr;
  Widget dropDownlist({required List answers, required int questionID}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        items: answers
            .map(
              (ans) => DropdownMenuItem<String>(
                value: ans['title'],
                child: Text(
                  ans['title'],
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

  String? radioAnswer;
  List<Widget> radioButtonlist(
      {required List answers, required int questionID}) {
    return answers
        .map(
          (answer) => RadioListTile<String>(
            value: answer['title'],
            contentPadding: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero)),
            groupValue: radioAnswer,
            title: Text(answer['title']),
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

  Widget _buildInnerWidget(SurveySection surveySection) {
    return Stack(
      children: [
        Column(
          children: surveySection.questions.map((question) {
            switch (question['questionTypeId']) {
              case 1:
                return buildQuestion(
                    title: question['title'],
                    isList: true,
                    answersWidget: (question['answers'] as List)
                        .map(
                          (ans) => CheckBoxList(
                            answer: ans,
                            questionID: ans['surveyQuestionId'],
                          ),
                        )
                        .toList());
              case 2:
                return buildQuestion(
                  title: question['title'],
                  isList: true,
                  answersWidget: radioButtonlist(
                    answers: question['answers'],
                    questionID: question['id'],
                  ),
                );
              case 3:
                return buildQuestion(
                  title: question['title'],
                  isList: false,
                  answersWidget: TextFormField(
                    textInputAction: TextInputAction.done,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    onFieldSubmitted: (value) {
                      submit_answers.addAll({
                        question['id']: value,
                      });
                    },
                    decoration: InputDecoration(
                      label: Text('Your answer here..'),
                    ),
                  ),
                );
              case 4:
                return buildQuestion(
                  title: question['title'],
                  isList: false,
                  answersWidget: dropDownlist(
                    answers: question['answers'],
                    questionID: question['id'],
                  ),
                );
              default:
                print(question);
                return Container();
            }
          }).toList(),
        ),
        Center(child: Text(surveySection.name)),
      ],
    );
  }
}

Map<int, dynamic> submit_answers = {};

class CheckBoxList extends StatefulWidget {
  CheckBoxList({required this.answer, required this.questionID});
  dynamic answer;
  int questionID;
  @override
  State<CheckBoxList> createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checked,
      title: Text(widget.answer['title']),
      onChanged: (value) {
        if (value!) {
          if (submit_answers[widget.questionID] == null) {
            submit_answers.addAll({
              widget.questionID: [],
            });
          }
          submit_answers[widget.questionID].add(widget.answer['id']);
        } else {
          submit_answers[widget.questionID].remove(widget.answer['id']);
          if (submit_answers[widget.questionID].isEmpty) {
            submit_answers.remove(widget.questionID);
          }
        }

        setState(() {
          checked = value;
        });

        print('answersID: ${submit_answers[widget.questionID]}');
        print('submit_answers: $submit_answers');
      },
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

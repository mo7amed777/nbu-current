import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:northern_border_university/view/widgets/input_field.dart';
import 'package:northern_border_university/view/widgets/my_button.dart';
import 'package:northern_border_university/view/widgets/radio_button.dart';

class SelfNomation extends StatefulWidget {
  @override
  SelfNomationState createState() => SelfNomationState();
}

class SelfNomationState extends State<SelfNomation> {
  bool isMale = true,
      isFemale = false,
      isMaleGroub = true,
      isFemaleGroub = true;

  bool tested = true,
      notTested = false,
      testedGroub = true,
      notTestedGroub = true;

  bool enrolled = true,
      notEnrolled = false,
      enrolledGroub = true,
      notEnrolledGroub = true;

  bool creative = true,
      notcreative = false,
      creativeGroub = true,
      notcreativeGroub = true;

  bool participated = true,
      notparticipated = false,
      participatedGroub = true,
      notparticipatedGroub = true;

  TextEditingController uidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController overallController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController testController = TextEditingController();
  TextEditingController fieldController = TextEditingController();
  TextEditingController highSchoolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    Color(0x22ff3a5a),
                    Color(0x22fe494d)
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
                    Color.fromARGB(193, 29, 25, 3),
                    Color(0xffff3a5a)
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
                    Color.fromARGB(193, 197, 154, 89),
                    Color(0xffff3a5a),
                  ])),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.app_registration_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          "Required Info",
                          style: TextStyle(
                              color: Colors.white,
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
              children: <Widget>[
                InputField(
                    controller: uidController,
                    secured: false,
                    prefex: Icon(
                      FontAwesomeIcons.idCard,
                    ),
                    label: 'University ID'),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: nameController,
                    secured: false,
                    prefex: Icon(
                      FontAwesomeIcons.user,
                    ),
                    label: 'Full Name'),
                SizedBox(
                  height: 10,
                ),
                RadioButton(
                  label: 'Gender : ',
                  firstOption: 'Male',
                  lastOption: 'Female',
                  firstValue: isMale,
                  lastValue: isFemale,
                  firstGroupValue: isMaleGroub,
                  lastGroupValue: isFemaleGroub,
                  onFirstChanged: () {
                    setState(() {
                      isMale = true;
                      isMaleGroub = true;
                      isFemale = false;
                    });
                  },
                  onLastChanged: () {
                    setState(() {
                      isFemale = true;
                      isFemaleGroub = true;
                      isMale = false;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: facultyController,
                    secured: false,
                    prefex: Icon(
                      FontAwesomeIcons.university,
                    ),
                    label: 'Faculty'),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: totalController,
                    secured: false,
                    prefex: Icon(
                      Icons.text_snippet,
                    ),
                    label: 'Total Grade'),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: highSchoolController,
                    secured: false,
                    prefex: Icon(
                      Icons.percent,
                    ),
                    label: 'High School persentage'),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: overallController,
                    secured: false,
                    prefex: Icon(
                      Icons.numbers,
                    ),
                    label: 'Overall Grade'),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: testController,
                    secured: false,
                    prefex: Icon(
                      Icons.article,
                    ),
                    label: 'Test Grade'),
                SizedBox(
                  height: 10,
                ),
                RadioButton(
                  label: 'Did you took a talent test?',
                  firstOption: 'Yes',
                  lastOption: 'No',
                  firstValue: tested,
                  lastValue: notTested,
                  firstGroupValue: testedGroub,
                  lastGroupValue: notTestedGroub,
                  onFirstChanged: () {
                    setState(() {
                      tested = true;
                      testedGroub = true;
                      notTested = false;
                    });
                  },
                  onLastChanged: () {
                    setState(() {
                      notTested = true;
                      notTestedGroub = true;
                      tested = false;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: gradeController,
                    secured: false,
                    prefex: Icon(
                      Icons.article_outlined,
                    ),
                    label: 'If yes please enter your grade'),
                SizedBox(
                  height: 10,
                ),
                RadioButton(
                  label:
                      'Have you ever enrolled in the general education stages?',
                  firstOption: 'Yes',
                  lastOption: 'No',
                  firstValue: enrolled,
                  lastValue: notEnrolled,
                  firstGroupValue: enrolledGroub,
                  lastGroupValue: notEnrolledGroub,
                  onFirstChanged: () {
                    setState(() {
                      enrolled = true;
                      enrolledGroub = true;
                      notEnrolled = false;
                    });
                  },
                  onLastChanged: () {
                    setState(() {
                      notEnrolled = true;
                      notEnrolledGroub = true;
                      enrolled = false;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RadioButton(
                  label:
                      'Do you have a creative with specific topics such as (AI,Mathematics ... etc.)',
                  firstOption: 'Yes',
                  lastOption: 'No',
                  firstValue: creative,
                  lastValue: notcreative,
                  firstGroupValue: creativeGroub,
                  lastGroupValue: notcreativeGroub,
                  onFirstChanged: () {
                    setState(() {
                      creative = true;
                      creativeGroub = true;
                      notcreative = false;
                    });
                  },
                  onLastChanged: () {
                    setState(() {
                      notcreative = true;
                      notcreativeGroub = true;
                      creative = false;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: fieldController,
                    secured: false,
                    prefex: Icon(
                      Icons.work,
                    ),
                    label: 'If yes enter your creative field'),
                SizedBox(
                  height: 10,
                ),
                RadioButton(
                  label:
                      'Have you ever participated in a science competition locally or internationally?',
                  firstOption: 'Yes',
                  lastOption: 'No',
                  firstValue: participated,
                  lastValue: notparticipated,
                  firstGroupValue: participatedGroub,
                  lastGroupValue: notparticipatedGroub,
                  onFirstChanged: () {
                    setState(() {
                      participated = true;
                      participatedGroub = true;
                      notparticipated = false;
                    });
                  },
                  onLastChanged: () {
                    setState(() {
                      notparticipated = true;
                      notparticipatedGroub = true;
                      participated = false;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: phoneController,
                    secured: false,
                    prefex: Icon(
                      FontAwesomeIcons.mobileAlt,
                    ),
                    label: 'Phone Number'),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    controller: emailController,
                    secured: false,
                    prefex: Icon(
                      Icons.email,
                    ),
                    label: 'Email'),
                SizedBox(
                  height: 25,
                ),
                MyButton(callback: () {}, label: 'Submit')
              ],
            ),
          ),
        ],
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

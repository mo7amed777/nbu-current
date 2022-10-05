import 'dart:convert';

import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/controller/functions.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/Surveys/surveys.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/mjales/signature.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;

class EServices extends StatefulWidget {
  const EServices({Key? key}) : super(key: key);

  @override
  State<EServices> createState() => _EServicesState();
}

class _EServicesState extends State<EServices> {
  Map<String, String> services = {
    'BlackBoard'.tr: 'assets/images/magazine/interFace3.png',
    'Surveys'.tr: 'assets/images/magazine/interFace3.png',
    'Admission and Registration (Students)'.tr:
        'assets/images/magazine/interFace3.png',
    'Academic calendar'.tr: 'assets/images/magazine/interFace3.png',
    'Student Housing'.tr: 'assets/images/magazine/webInterFace.png',
    'Scolarships'.tr: 'assets/images/magazine/webInterFace.png',
    'E-Forms System'.tr: 'assets/images/magazine/interFace3.png',
    'Employees Complaints'.tr: 'assets/images/magazine/interFace3.png',
    'Testahel'.tr: 'assets/images/magazine/interFace3.png',
    'Office 365'.tr: 'assets/images/magazine/interFace3.png',
    'E-mails'.tr: 'assets/images/magazine/interFace3.png',
    'Digital Library'.tr: 'assets/images/magazine/interFace3.png',
    'Argos'.tr: 'assets/images/magazine/interFace3.png',
    'Symphony Library System'.tr: 'assets/images/magazine/interFace3.png',
    'Students Password Reset'.tr: 'assets/images/magazine/interFace3.png',
    'Marafiq - Operation and Maintenance'.tr:
        'assets/images/magazine/interFace3.png',
    'Blackboard Students'.tr: 'assets/images/magazine/interFace3.png',
    'Student Card Application'.tr: 'assets/images/magazine/interFace3.png',
    'Admission and Registration (Faculty Members)'.tr:
        'assets/images/magazine/webInterFace.png',
    'Research Management'.tr: 'assets/images/magazine/interFace3.png',
    'Progress'.tr: 'assets/images/magazine/interFace3.png',
    'Employees Password Reset'.tr: 'assets/images/magazine/interFace3.png',
    'Request a Computer'.tr: 'assets/images/magazine/interFace3.png',
    'IP Phones'.tr: 'assets/images/magazine/interFace3.png',
    'E-transactions (Barq)'.tr: 'assets/images/magazine/interFace3.png',
    'Self-Service Portal'.tr: 'assets/images/magazine/interFace3.png',
    'SUPPORT-ME'.tr: 'assets/images/magazine/interFace3.png',
    'Majales'.tr: 'assets/images/magazine/interFace3.png',
    'Training Programs at Public Administration Institute'.tr:
        'assets/images/magazine/webInterFace.png',
    'Employee of the Year'.tr: 'assets/images/magazine/webInterFace.png',
    'E-Archiving'.tr: 'assets/images/magazine/interFace3.png',
  };
  Map<String, String> searchList = {};
  bool notFound = false;

  String userID = '3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: AnimationLimiter(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Appbar(
                  title: 'E-Services',
                  search: Icons.search,
                  onSearch: (String val) {
                    // clear list on the begging of Search process ...
                    searchList.clear();
                    setState(() {
                      services.keys.toList().forEach((key) {
                        if (key.toLowerCase().contains(val.toLowerCase())) {
                          notFound = false;
                          searchList.addAll({key: services[key]!});
                        }
                      });
                      if (searchList.isEmpty && val.isNotEmpty) {
                        //No Search Results
                        notFound = true;
                      }
                    });
                  },
                  onIconPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }),
            ),
            notFound
                ? Center(
                    child: Image.asset(
                      'assets/images/e-services/search_not_found.png',
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      shrinkWrap: true,
                      childAspectRatio: 1,
                      children: List.generate(
                        searchList.isEmpty
                            ? services.length
                            : searchList.length,
                        (int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 1000),
                            columnCount: 2,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: AspectRatio(
                                  aspectRatio: 1.5,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0),
                                    ),
                                    child: InkWell(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0),
                                      ),
                                      onTap: () => callBack(
                                        searchList.isEmpty
                                            ? services.keys.toList()[index]
                                            : searchList.keys.toList()[index],
                                      ),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        elevation: 2.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 50,
                                              backgroundImage: AssetImage(
                                                services.values.toList()[index],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                searchList.isEmpty
                                                    ? services.keys
                                                        .toList()[index]
                                                    : searchList.keys
                                                        .toList()[index],
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme.green,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

// key param refer to service name
  void callBack(String key) async {
    Article article = Article();
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    await article.getAllItems();
    String imgURL = await article.getItemImageURL(article.items[0]);

    if (key == 'Majales'.tr) {
      Get.back();
      Get.to(Signature.new);
    } else if (key == 'Surveys'.tr) {
      getSurveys();
    } else {
      Get.back();
      showSnackBar(message: '.. Coming Soon');
    }
  }

  void getSurveys() async {
    //userID is the ID of Target User who have to see this Survey
    //Replace with id which come from login api of signed user ex. userID = 3
    try {
      final http.Response response = await http.get(
          Uri.parse("http://10.220.17.59/API/NBUSurvey/GetSurvey/$userID"));
      List surveys = jsonDecode(response.body);
      Get.back();
      Get.to(() => Surveys(surveys: surveys));
    } catch (e) {
      Get.back();
      showSnackBar(message: '!Error is happened', err: true);
    }
  }
}

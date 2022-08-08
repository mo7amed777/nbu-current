import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';
import 'package:northern_border_university/view/screens/main_screens/Colleges/college_departments.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class EServices extends StatefulWidget {
  const EServices({Key? key}) : super(key: key);

  @override
  State<EServices> createState() => _EServicesState();
}

class _EServicesState extends State<EServices> {
  Map<String, String> services = {
    'BlackBoard': 'assets/images/magazine/interFace3.png',
    'Admission and Registration (Students)':
        'assets/images/magazine/interFace3.png',
    'Users Identification': 'assets/images/magazine/interFace3.png',
    'Academic calendar': 'assets/images/magazine/interFace3.png',
    'Student Housing': 'assets/images/magazine/webInterFace.png',
    'Scolarships': 'assets/images/magazine/webInterFace.png',
    'Free Software Programs': 'assets/images/magazine/interFace3.png',
    'Creat a New Account': 'assets/images/magazine/interFace3.png',
    'Testahel': 'assets/images/magazine/interFace3.png',
    'Office 365': 'assets/images/magazine/interFace3.png',
    'E-mails': 'assets/images/magazine/interFace3.png',
    'Digital Library': 'assets/images/magazine/interFace3.png',
    'Argos': 'assets/images/magazine/interFace3.png',
    'Symphony Library System': 'assets/images/magazine/interFace3.png',
    'Students Password Reset': 'assets/images/magazine/interFace3.png',
    'Calculate Your GPA': 'assets/images/magazine/interFace3.png',
    'Blackboard Students': 'assets/images/magazine/interFace3.png',
    'Student Card Application': 'assets/images/magazine/interFace3.png',
    'Admission and Registration (Faculty Members)':
        'assets/images/magazine/webInterFace.png',
    'Research Management': 'assets/images/magazine/interFace3.png',
    'Progress': 'assets/images/magazine/interFace3.png',
    'Reset Password': 'assets/images/magazine/interFace3.png',
    'Request a Computer': 'assets/images/magazine/interFace3.png',
    'IP Phones': 'assets/images/magazine/interFace3.png',
    'E-transactions (Barq)': 'assets/images/magazine/interFace3.png',
    'Self-Service Portal': 'assets/images/magazine/interFace3.png',
    'SUPPORT-ME': 'assets/images/magazine/interFace3.png',
    'Majales': 'assets/images/magazine/interFace3.png',
    'Training Programs at the Institute of Public Administration':
        'assets/images/magazine/webInterFace.png',
    'Employee of the Year': 'assets/images/magazine/webInterFace.png',
    'E-Archiving': 'assets/images/magazine/interFace3.png',
  };
  Map<String, String> search_list = {};
  Map<String, String> not_found = {
    'No Results Found!': 'assets/images/e-services/search_not_found.png',
  };

  TextEditingController searchController = TextEditingController();

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
                  search: true,
                  view: false,
                  searchController: searchController,
                  onSearch: (String val) {
                    search_list.clear();
                    setState(() {
                      services.keys.toList().forEach((key) {
                        if (key.toLowerCase().contains(val.toLowerCase())) {
                          search_list.addAll({key: services[key]!});
                        }
                      });
                    });
                  },
                  onIconPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }),
            ),
            Padding(
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
                  search_list.isEmpty ? services.length : search_list.length,
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                              child: InkWell(
                                splashColor: Colors.grey.withOpacity(0.2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                                onTap: () => callBack(search_list.isEmpty
                                    ? services.keys.toList()[index]
                                    : search_list.keys.toList()[index]),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 2.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 55,
                                        backgroundImage: AssetImage(
                                            services.values.toList()[index]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          search_list.isEmpty
                                              ? services.keys.toList()[index]
                                              : search_list.keys
                                                  .toList()[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppTheme.darkerText,
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

  void callBack(String key) async {
    //Article article = Article();
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    //await article.getAllItems();
    //String imgURL = await article.getItemImageURL(article.items[0]);
    Get.back();
    // Get.to(TheUniversityPresident(
    //     article: article, imgURL: imgURL, item: article.items[7]));
    Get.to(CollegeDepartments(
      college: key,
    ));
  }
}

import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/The%20University%20President.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/mjales/signature.dart';
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
  Map<String, String> searchList = {};
  bool notFound = false;

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
    Get.back();
    switch (key) {
      //TODO: Replace with full switch cases of keys(Service Names) List
      case 'Majales':
        // Just for testing signature screen to draW & save own sign
        Get.to(Signature());
        break;
      default:
        Get.to(
          TheUniversityPresident(
            article: article,
            imgURL: imgURL,
            item: article.items[7],
          ),
        );
    }
  }
}

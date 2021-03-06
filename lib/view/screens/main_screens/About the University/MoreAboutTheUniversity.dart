import 'package:get/get.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/AnnualReports.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/ContactUS.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/FactsandFigures.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/Guides.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/Location.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/StratigicPlan.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/University%20Council/UniversityCouncil.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/VisionandGoals.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/The%20University%20President.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/Deanships/Deanships.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MoreAboutTheUniversity extends StatefulWidget {
  const MoreAboutTheUniversity({Key? key}) : super(key: key);

  @override
  State<MoreAboutTheUniversity> createState() => _MoreAboutTheUniversityState();
}

class _MoreAboutTheUniversityState extends State<MoreAboutTheUniversity> {
  Map<String, String> items = {
    'Vision and Goals': 'assets/images/magazine/webInterFace.png',
    'Strategic Plan': 'assets/images/magazine/webInterFace.png',
    'Facts and Figures': 'assets/images/magazine/interFace3.png',
    'Guides': 'assets/images/magazine/interFace3.png',
    'Location': 'assets/images/magazine/webInterFace.png',
    'Annual Reports': 'assets/images/magazine/webInterFace.png',
    'Contact US': 'assets/images/magazine/interFace3.png',
    'University Council': 'assets/images/magazine/interFace3.png',
  };
  bool multiple = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Appbar(
                  title: 'About The University',
                  icon: multiple ? Icons.dashboard : Icons.view_agenda,
                  onSearch: () {},
                  onIconPressed: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                crossAxisCount: multiple ? 2 : 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                shrinkWrap: true,
                childAspectRatio: multiple ? 1 : 2,
                children: List.generate(
                  8,
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
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image.asset(
                                      items.values.toList()[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.grey.withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4.0)),
                                      onTap: () =>
                                          callBack(items.keys.toList()[index]),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.all(multiple ? 4.0 : 6.0),
                                      margin:
                                          EdgeInsets.all(multiple ? 4.0 : 6.0),
                                      color: AppTheme.dark_grey,
                                      child: Text(
                                        items.keys.toList()[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.white,
                                          fontSize: multiple ? 16 : 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
      case 'Vision and Goals':
        Get.to(VisionandGoals());
        break;
      case 'Strategic Plan':
        Get.to(StratigicPlan());
        break;
      case 'Location':
        Get.to(Location());
        break;
      case 'Facts and Figures':
        Get.to(FactsandFigures());
        break;
      case 'Guides':
        Get.to(Guides());
        break;
      case 'Deanship\'s':
        Get.to(Deanships());
        break;
      case 'Annual Reports':
        Get.to(AnnualReports());
        break;
      case 'Contact US':
        Get.to(ContactUS());
        break;
      case 'University Council':
        Get.to(UniversityCouncil());
        break;
    }
  }
}

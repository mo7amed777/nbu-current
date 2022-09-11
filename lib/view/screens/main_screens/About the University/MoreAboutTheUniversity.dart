import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
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
                onSearch: () {},
              ),
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
                  items.length,
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                                onTap: () =>
                                    callBack(items.keys.toList()[index]),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 2.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                            items.values.toList()[index]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          items.isEmpty
                                              ? items.keys.toList()[index]
                                              : items.keys.toList()[index],
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
        Get.to(() => VisionandGoals());
        break;
      case 'Strategic Plan':
        Get.to(() => StratigicPlan());
        break;
      case 'Location':
        Get.to(() => Location());
        break;
      case 'Facts and Figures':
        Get.to(() => FactsandFigures());
        break;
      case 'Guides':
        Get.to(() => Guides());
        break;
      case 'Deanship\'s':
        Get.to(() => Deanships());
        break;
      case 'Annual Reports':
        Get.to(() => AnnualReports());
        break;
      case 'Contact US':
        Get.to(() => ContactUS());
        break;
      case 'University Council':
        Get.to(() => UniversityCouncil());
        break;
    }
  }
}

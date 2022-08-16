import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/Contact%20US.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/President%20Subordinating%20Units/Advisors%20Office.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/President%20Subordinating%20Units/General%20Administration.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/President%20Subordinating%20Units/Project%20Management%20Office.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/President%20Subordinating%20Units/Risk%20Management%20Unit.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/President%20Subordinating%20Units/Self-generated%20Monitoring.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PresidentSubordinatingUnits extends StatefulWidget {
  const PresidentSubordinatingUnits({Key? key}) : super(key: key);

  @override
  State<PresidentSubordinatingUnits> createState() =>
      _PresidentSubordinatingUnitsState();
}

class _PresidentSubordinatingUnitsState
    extends State<PresidentSubordinatingUnits> {
  Map<String, String> items = {
    'Advisors\' Office': 'assets/images/magazine/webInterFace.png',
    'Project Management': 'assets/images/magazine/webInterFace.png',
    'Self-generated Res.': 'assets/images/magazine/interFace3.png',
    'Risk Management': 'assets/images/magazine/interFace3.png',
    'General Admin': 'assets/images/magazine/webInterFace.png',
    'Contact US': 'assets/images/magazine/webInterFace.png',
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
                title: 'Subordinating Units',
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
                                      Text(
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
      case 'Advisors\' Office':
        Get.to(AdvisorsOffice());
        break;
      case 'Project Management':
        Get.to(ProjectManagementOffice());
        break;
      case 'Self-generated Res.':
        Get.to(SelfGeneratedResourcesMonitoringUnit());
        break;
      case 'Risk Management':
        Get.to(RiskManagementUnit());
        break;
      case 'General Admin':
        Get.to(GeneralAdministration());
        break;
      case 'Contact US':
        Get.to(ContactOurOffice());
        break;
    }
  }
}

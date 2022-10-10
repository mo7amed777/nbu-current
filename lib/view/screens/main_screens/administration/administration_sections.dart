import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/ProfM_AlShihri.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/The%20University%20President.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/PresidentOffice.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/The%20Vice%20Presidency/VicePresidencies.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Administrations extends StatefulWidget {
  const Administrations({Key? key}) : super(key: key);

  @override
  State<Administrations> createState() => _AdministrationsState();
}

class _AdministrationsState extends State<Administrations> {
  Map<String, String> items = {
    'The President'.tr: 'assets/images/magazine/webInterFace.png',
    'The Resume'.tr: 'assets/images/magazine/webInterFace.png',
    'President Office'.tr: 'assets/images/magazine/interFace3.png',
    'Vice-President'.tr: 'assets/images/magazine/interFace3.png',
    'Deanship\'s'.tr: 'assets/images/magazine/webInterFace.png',
    'Centers'.tr: 'assets/images/magazine/webInterFace.png',
    'Administrations'.tr: 'assets/images/magazine/interFace3.png',
    'Faculty Members'.tr: 'assets/images/magazine/interFace3.png',
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
                title: 'Administration'.tr,
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
      case 'The President':
        imgURL = await article.getItemImageURL(article.items[0]);
        Get.to(() => TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[0]));
        break;
      case 'The Resume':
        Get.to(ProfM_AlShihri.new);
        break;
      case 'President Office':
        Get.to(UniversityPresidentOffice.new);
        break;
      case 'Vice-President':
        Get.to(VicePresidencies.new);
        break;
      case 'Deanship\'s':
        // Get.to(() =>Deanships());
        imgURL = await article.getItemImageURL(article.items[0]);
        Get.to(() => TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[0]));
        break;
      case 'Centers':
        //Get.to(() =>Centers());
        imgURL = await article.getItemImageURL(article.items[1]);
        Get.to(() => TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[1]));
        break;
      case 'Administrations':
        imgURL = await article.getItemImageURL(article.items[10]);

        Get.to(() => TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[2]));
        break;
      case 'Faculty Members':
        // Get.to(() =>FacultyMembers());
        imgURL = await article.getItemImageURL(article.items[8]);

        Get.to(() => TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[5]));
        break;
    }
  }
}

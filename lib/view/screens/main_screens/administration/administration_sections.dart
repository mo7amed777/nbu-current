import 'package:get/get.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/ProfM_AlShihri.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/The%20University%20President.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/Centers/Centers.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/Deanships/Deanships.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/PresidentOffice.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/The%20Vice%20Presidency/VicePresidencies.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/FacultyMembers.dart';
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
    'The President': 'assets/images/magazine/webInterFace.png',
    'The Resume': 'assets/images/magazine/webInterFace.png',
    'President Office': 'assets/images/magazine/interFace3.png',
    'Vice-President': 'assets/images/magazine/interFace3.png',
    'Deanship\'s': 'assets/images/magazine/webInterFace.png',
    'Centers': 'assets/images/magazine/webInterFace.png',
    'Administrations': 'assets/images/magazine/interFace3.png',
    'Faculty Members': 'assets/images/magazine/interFace3.png',
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
                  title: 'Administrations',
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
      case 'The President':
        imgURL = await article.getItemImageURL(article.items[0]);
        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[0]));
        break;
      case 'The Resume':
        Get.to(ProfM_AlShihri());
        break;
      case 'President Office':
        Get.to(UniversityPresidentOffice());
        break;
      case 'Vice-President':
        Get.to(VicePresidencies());
        break;
      case 'Deanship\'s':
        // Get.to(Deanships());
        imgURL = await article.getItemImageURL(article.items[0]);
        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[0]));
        break;
      case 'Centers':
        //Get.to(Centers());
        imgURL = await article.getItemImageURL(article.items[1]);
        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[1]));
        break;
      case 'Administrations':
        imgURL = await article.getItemImageURL(article.items[10]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[2]));
        break;
      case 'Faculty Members':
        // Get.to(FacultyMembers());
        imgURL = await article.getItemImageURL(article.items[8]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[5]));
        break;
    }
  }
}

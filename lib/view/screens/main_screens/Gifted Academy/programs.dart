import 'package:get/get.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/The%20University%20President.dart';
import 'package:northern_border_university/view/screens/main_screens/Gifted%20Academy/nomation.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Programs extends StatefulWidget {
  const Programs({Key? key}) : super(key: key);

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  Map<String, String> items = {
    'Acceleration': 'assets/images/magazine/webInterFace.png',
    'Future Pioneers': 'assets/images/magazine/webInterFace.png',
    'Apprenticships': 'assets/images/magazine/interFace3.png',
    'Dual Enrollment': 'assets/images/magazine/interFace3.png',
    'Self-nomination': 'assets/images/magazine/webInterFace.png',
    'Vision & Mission': 'assets/images/magazine/webInterFace.png',
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
                  title: 'Academic Programs',
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
                  6,
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
      case 'Acceleration':
        imgURL = await article.getItemImageURL(article.items[0]);
        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[0]));
        break;
      case 'Future Pioneers':
        imgURL = await article.getItemImageURL(article.items[1]);
        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[1]));
        break;
      case 'Apprenticships':
        imgURL = await article.getItemImageURL(article.items[2]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[2]));
        break;
      case 'Dual Enrollment':
        imgURL = await article.getItemImageURL(article.items[3]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[3]));
        break;
      case 'Self-nomination':
        imgURL = await article.getItemImageURL(article.items[4]);

        Get.to(SelfNomation());
        break;
      case 'Vision & Mission':
        imgURL = await article.getItemImageURL(article.items[5]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[5]));
        break;
    }
  }
}

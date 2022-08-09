import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/The%20University%20President.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CollegeDepartments extends StatefulWidget {
  final String college;
  const CollegeDepartments({required this.college});

  @override
  State<CollegeDepartments> createState() => _CollegeDepartmentsState();
}

class _CollegeDepartmentsState extends State<CollegeDepartments> {
  Map<String, String> departments = {
    'chemistry': 'assets/images/magazine/webInterFace.png',
    'Mathematics': 'assets/images/magazine/webInterFace.png',
    'physics': 'assets/images/magazine/interFace3.png',
    'Computer Science': 'assets/images/magazine/interFace3.png',
    'Biology': 'assets/images/magazine/webInterFace.png',
    'Education': 'assets/images/magazine/webInterFace.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Appbar(
                title: widget.college,
                onSearch: (val) {},
                search: true,
                view: false,
                onIconPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                shrinkWrap: true,
                childAspectRatio: 1,
                children: List.generate(
                  departments.length,
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
                                      departments.values.toList()[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.grey.withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4.0)),
                                      onTap: () => callBack(
                                          departments.keys.toList()[index]),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(4.0),
                                      margin: EdgeInsets.all(4.0),
                                      color: AppTheme.dark_grey,
                                      child: Text(
                                        departments.keys.toList()[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          color: AppTheme.white,
                                          fontSize: 14,
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
    Get.to(TheUniversityPresident(
        article: article, imgURL: imgURL, item: article.items[7]));
  }
}

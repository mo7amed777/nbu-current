import 'package:get/get.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/The%20University%20President.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/media_center/filter/filter_list.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/media_center/filter/filters_screen.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Colleges extends StatefulWidget {
  const Colleges({Key? key}) : super(key: key);

  @override
  State<Colleges> createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  List<PopularFilterListData> popularFilterListData = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'Arar',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Rafha',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Turaif',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Al-uwayqilah',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'All Colleges',
      isSelected: false,
    ),
  ];

  Map<String, String> items = {
    '(Applied College (Rafha - delete':
        'assets/images/magazine/webInterFace.png',
    'Al-Uweqilih Branch': 'assets/images/magazine/webInterFace.png',
    'Faculty of Science and Arts in Turaif':
        'assets/images/magazine/interFace3.png',
    'Applied Faculty in Arar': 'assets/images/magazine/interFace3.png',
    'Faculty of Sciences and Arts in Rafha':
        'assets/images/magazine/webInterFace.png',
    'Faculty of Engineering': 'assets/images/magazine/webInterFace.png',
    '(Applied College (Turaif - delete':
        'assets/images/magazine/interFace3.png',
    'Faculty of Computing and Information Technology':
        'assets/images/magazine/interFace3.png',
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
                  title: 'Colleges',
                  icon: Icons.sort,
                  onSearch: () {},
                  onIconPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => FiltersScreen(
                              popularFilterListData: popularFilterListData,
                              isCollegesFilter: true),
                          fullscreenDialog: true),
                    );
                  }),
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
                                      padding: EdgeInsets.all(4.0),
                                      margin: EdgeInsets.all(4.0),
                                      color: AppTheme.dark_grey,
                                      child: Text(
                                        items.keys.toList()[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          color: AppTheme.white,
                                          fontSize: 16,
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
      case '(Applied College (Rafha - delete':
        imgURL = await article.getItemImageURL(article.items[0]);
        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[0]));
        break;
      case 'Al-Uweqilih Branch':
        imgURL = await article.getItemImageURL(article.items[1]);
        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[1]));
        break;
      case 'Faculty of Science and Arts in Turaif':
        imgURL = await article.getItemImageURL(article.items[2]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[3]));
        break;
      case 'Applied Faculty in Arar':
        imgURL = await article.getItemImageURL(article.items[4]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[5]));
        break;
      case 'Faculty of Sciences and Arts in Rafha':
        imgURL = await article.getItemImageURL(article.items[6]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[7]));
        break;
      case 'Faculty of Engineering':
        imgURL = await article.getItemImageURL(article.items[8]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[9]));
        break;
      case '(Applied College (Turaif - delete':
        imgURL = await article.getItemImageURL(article.items[10]);

        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[2]));
        break;
      case 'Faculty of Computing and Information Technology':
        imgURL = await article.getItemImageURL(article.items[3]);
        Get.to(TheUniversityPresident(
            article: article, imgURL: imgURL, item: article.items[7]));
        break;
    }
  }
}

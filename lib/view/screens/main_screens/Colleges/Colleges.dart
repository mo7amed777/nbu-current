import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  List<String> locations = [
    'Arar',
    'Rafha',
    'Turaif',
    'Al-uwayqilah',
    'All Colleges',
  ];

  Map<String, String> arar = {
    'Faculty of Science': 'assets/images/magazine/webInterFace.png',
    'Faculty of Engineering': 'assets/images/magazine/webInterFace.png',
    'Faculty of Medical Sciences': 'assets/images/magazine/interFace3.png',
    'Faculty of Medicine': 'assets/images/magazine/interFace3.png',
    'Faculty of Nursing': 'assets/images/magazine/webInterFace.png',
    'Faculty of Education and Arts': 'assets/images/magazine/webInterFace.png',
    'Faculty of Family & Consumer Sciences':
        'assets/images/magazine/interFace3.png',
    'Faculty of Computing and Information Technology':
        'assets/images/magazine/interFace3.png',
    'Applied Faculty in Arar': 'assets/images/magazine/interFace3.png',
  };
  Map<String, String> rafha = {
    'Faculty of Sciences and Arts in Rafha':
        'assets/images/magazine/webInterFace.png',
    'College of Pharmacy': 'assets/images/magazine/webInterFace.png',
    'Faculty of Computing and Information Technology':
        'assets/images/magazine/interFace3.png',
  };
  Map<String, String> turaif = {
    'Faculty of Science and Arts in Turaif':
        'assets/images/magazine/webInterFace.png',
  };
  Map<String, String> uwayqilah = {
    'Al-Uweqilih Branch': 'assets/images/magazine/webInterFace.png',
  };

  Map<String, String> colleges = {};
  @override
  void initState() {
    super.initState();
    colleges.addAll(arar);
    colleges.addAll(rafha);
    colleges.addAll(turaif);
    colleges.addAll(uwayqilah);
  }

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
                  icon: FontAwesomeIcons.searchLocation,
                  onSearch: () {},
                  onIconPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    await Get.dialog(
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: const [
                              Color.fromARGB(255, 48, 133, 202),
                              Color.fromARGB(255, 120, 177, 73),
                            ]),
                          ),
                          child: ListView.separated(
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      onPressed: () {
                                        Get.back();
                                        switch (index) {
                                          // 'Arar',
                                          // 'Rafha',
                                          // 'Turaif',
                                          // 'Al-uwayqilah',
                                          // 'All Colleges',
                                          case 0:
                                            colleges = arar;
                                            break;
                                          case 1:
                                            colleges = rafha;
                                            break;
                                          case 2:
                                            colleges = turaif;
                                            break;
                                          case 3:
                                            colleges = uwayqilah;
                                            break;

                                          default:
                                            colleges.addAll(arar);
                                            colleges.addAll(rafha);
                                            colleges.addAll(turaif);
                                            colleges.addAll(uwayqilah);
                                        }
                                      },
                                      child: Text(
                                        locations[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              separatorBuilder: ((context, index) => Divider(
                                    height: 7,
                                    indent: 25,
                                    endIndent: 25,
                                  )),
                              itemCount: locations.length),
                        ),
                      ),
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
                  colleges.length,
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
                                      colleges.values.toList()[index],
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
                                          colleges.keys.toList()[index]),
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
                                        colleges.keys.toList()[index],
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

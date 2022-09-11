import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/view/screens/main_screens/Colleges/college_departments.dart';
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
                          height: MediaQuery.of(context).size.height * 0.45,
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
                                          color: AppTheme.white,
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
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
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
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                                onTap: () =>
                                    callBack(colleges.keys.toList()[index]),
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
                                            colleges.values.toList()[index]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          colleges.isEmpty
                                              ? colleges.keys.toList()[index]
                                              : colleges.keys.toList()[index],
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
    //Article article = Article();
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    //await article.getAllItems();
    //String imgURL = await article.getItemImageURL(article.items[0]);
    Get.back();
    // Get.to(() =>TheUniversityPresident(
    //     article: article, imgURL: imgURL, item: article.items[7]));
    Get.to(() => CollegeDepartments(
          college: key,
        ));
  }
}

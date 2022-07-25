import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/themes/media_center_theme.dart';
import 'package:northern_border_university/model/homelist.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/media_center/list_view/media_center_list_view.dart';
import 'package:northern_border_university/view/screens/settings/settings.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController? animationController;
  List<HomeList> homeList = HomeList.homeList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: MediaCenterAppTheme.buildLightTheme(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 6),
                    child: Appbar(
                      title: 'Home',
                      onSearch: () {},
                      icon: FontAwesomeIcons.edit,
                      view: true,
                      onIconPressed: () {
                        Get.to(Settings());
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemExtent: MediaQuery.of(context).size.width * 0.7,
                      itemCount: homeList.length,
                      padding: const EdgeInsets.only(top: 8),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final int count =
                            homeList.length > 10 ? 10 : homeList.length;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController!,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                        animationController?.forward();
                        return MediaCenterListView(
                          data: {
                            'title': homeList[index].title,
                            'subTxt': homeList[index].subTxt,
                            'imagePath': homeList[index].imagePath,
                            'callback': homeList[index].callback,
                            'icon': homeList[index].icon,
                          },
                          animation: animation,
                          animationController: animationController!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

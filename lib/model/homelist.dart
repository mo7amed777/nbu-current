import 'package:northern_border_university/view/screens/main_screens/Main Menu/Administration/Administration.dart';
import 'package:northern_border_university/view/screens/main_screens/Main%20Menu/About%20the%20University/AboutTheUniversity.dart';
import 'package:northern_border_university/view/screens/main_screens/Main%20Menu/Colleges/Colleges.dart';
import 'package:northern_border_university/view/screens/main_screens/Main%20Menu/Magazine/Magazine.dart';
import 'package:northern_border_university/view/screens/main_screens/Main%20Menu/Media%20Center/MediaCenter.dart';
import 'package:northern_border_university/view/screens/main_screens/Main%20Menu/Media%20Center/News/News.dart';
import '../controller/themes/app_theme.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/splash/introduction_animation_screen.dart';

class HomeList {
  HomeList({
    required this.callback,
    this.imagePath = '',
    this.title = '',
    this.color = AppTheme.white,
  });
  Function callback;
  String imagePath;
  String title;
  Color color;
  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/introduction_animation/Administration.jpg',
      title: 'Administration',
      color: HexColor("003255"),
      callback: () async {
        try {
          Get.to(Administration());
        } catch (e) {
          print(e);
        }
      },
    ),
    HomeList(
      imagePath: 'assets/images/media_center/Media_Centre.jpg',
      title: 'Media Centre',
      color: HexColor("052751"),
      callback: () {
        Get.to(News());
        // Get.to(MediaCenter());
      },
    ),
    HomeList(
      imagePath: 'assets/images/colleges/colleges.jpg',
      title: 'Colleges',
      color: HexColor("146564"),
      callback: () {
        Get.to(Colleges());
      },
    ),
    HomeList(
      imagePath: 'assets/images/magazine/magazine.jpg',
      title: 'Magazine',
      color: HexColor("2C2C2C"),
      callback: () {
        Get.to(Magazine());
      },
    ),
    HomeList(
      imagePath: 'assets/images/services.png',
      title: 'E-Services',
      color: HexColor("003865"),
      callback: () {
        Get.to(IntroductionAnimationScreen(
          pageNumber: 0.8,
          seconds: 1,
        ));
      },
    ),
    HomeList(
      imagePath: 'assets/images/about_us.jpg',
      title: 'About The University',
      color: HexColor("010F18"),
      callback: () {
        Get.to(AboutTheUniversity());
      },
    ),
    //
    // HomeList(
    //   imagePath: 'assets/images/help.jpg',
    //   title: 'Help',
    //   navigattionScreen: HelpScreen(),
    //   color: HexColor("BA0100"),
    //   callback: () {},
    // ),
  ];
}

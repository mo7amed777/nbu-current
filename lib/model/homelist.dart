import 'package:northern_border_university/view/screens/darwer_screens/about%20US.dart';
import 'package:northern_border_university/view/screens/main_screens/administration/administrations.dart';
import 'package:northern_border_university/view/screens/main_screens/colleges/colleges_screen.dart';
import '../controller/themes/app_theme.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/main_screens/magazine/magazine_screen.dart';
import '../view/screens/main_screens/media_center/media_center_screen.dart';
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
      imagePath: 'assets/introduction_animation/Administration.jpg',
      title: 'Administration',
      color: HexColor("003255"),
      callback: () async {
        try {
          Get.to(Administrations());
        } catch (e) {
          print(e);
        }
      },
    ),
    HomeList(
      imagePath: 'assets/media_center/Media_Centre.jpg',
      title: 'Media Centre',
      color: HexColor("052751"),
      callback: () {
        Get.to(MediaCenterHomeScreen());
      },
    ),
    HomeList(
      imagePath: 'assets/colleges/colleges.jpg',
      title: 'Colleges',
      color: HexColor("146564"),
      callback: () {
        Get.to(FitnessAppHomeScreen());
      },
    ),
    HomeList(
      imagePath: 'assets/magazine/magazine.jpg',
      title: 'Magazine',
      color: HexColor("2C2C2C"),
      callback: () {
        Get.to(DesignCourseHomeScreen());
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
      title: 'About US',
      color: HexColor("010F18"),
      callback: () {
        Get.to(AboutUS());
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

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/AboutTheUniversity.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/Administration.dart';
import 'package:northern_border_university/view/screens/main_screens/Colleges/Colleges.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/view/screens/main_screens/Gifted%20Academy/gifted_academy.dart';
import '../view/screens/main_screens/Magazine/magazine_screen.dart';
import '../view/screens/main_screens/Media Center/media_center/media_center_screen.dart';
import '../view/screens/splash/introduction_animation_screen.dart';

class HomeList {
  HomeList({
    required this.callback,
    this.imagePath = '',
    this.title = '',
    this.subTxt = '',
    this.icon = FontAwesomeIcons.university,
  });
  Function callback;
  String imagePath;
  String title;
  String subTxt;
  IconData icon;
  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/introduction_animation/Administration.jpg',
      title: 'Administration',
      subTxt: 'Administration & Management Stuff',
      icon: FontAwesomeIcons.users,
      callback: () async {
        try {
          Get.to(Administration.new);
        } catch (e) {
          print(e);
        }
      },
    ),
    HomeList(
      imagePath: 'assets/images/media_center/Media_Centre.jpg',
      title: 'Media Centre',
      subTxt: 'Videos, Photos and Other',
      icon: FontAwesomeIcons.video,
      callback: () {
        Get.to(MediaCenter.new);
      },
    ),
    HomeList(
      imagePath: 'assets/images/colleges/colleges.jpg',
      title: 'Colleges',
      subTxt: 'Arar, Rafha and other',
      callback: () {
        Get.to(Colleges.new);
      },
    ),
    HomeList(
      imagePath: 'assets/images/magazine/magazine.jpg',
      title: 'Magazine',
      subTxt: 'Science and Humanites Journals',
      icon: FontAwesomeIcons.journalWhills,
      callback: () {
        Get.to(Magazine.new);
      },
    ),
    HomeList(
      imagePath: 'assets/images/media/services.png',
      title: 'e-services',
      subTxt: 'The University whole stuff services',
      icon: FontAwesomeIcons.servicestack,
      callback: () {
        Get.to(() => IntroductionAnimationScreen(
              pageNumber: 0.8,
              seconds: 1,
            ));
      },
    ),
    HomeList(
      imagePath: 'assets/images/media/about_us.jpg',
      title: 'About The University',
      subTxt: 'Locaton, Contact Info and other',
      icon: FontAwesomeIcons.infoCircle,
      callback: () {
        Get.to(AboutTheUniversity.new);
      },
    ),
    HomeList(
      imagePath: 'assets/images/media/gifted_academy.jpg',
      title: 'Gifted Students Academy',
      subTxt: 'exploring & attracting talented students',
      icon: FontAwesomeIcons.graduationCap,
      callback: () {
        Get.to(GiftedAcademy.new);
      },
    ),
  ];
}

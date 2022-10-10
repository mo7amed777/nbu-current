import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/model/homelist.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/AboutTheUniversity.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/administration_sections.dart';
import 'package:northern_border_university/view/screens/main_screens/Colleges/Colleges.dart';
import 'package:northern_border_university/view/screens/main_screens/Gifted%20Academy/gifted_academy.dart';
import 'package:northern_border_university/view/screens/main_screens/Magazine/magazine_screen.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/media_center/media_center_screen.dart';
import 'package:northern_border_university/view/screens/onboard/login/login_screen.dart';
import 'package:northern_border_university/view/screens/onboard/login/widgets/round_button.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
              child: Appbar(
                title: 'Home'.tr,
                onSearch: () {},
                icon: FontAwesomeIcons.edit,
                onIconPressed: () async {
                  bool isAppBadgeSupported =
                      await FlutterAppBadger.isAppBadgeSupported();
                  if (isAppBadgeSupported) {
                    FlutterAppBadger.updateBadgeCount(1);
                  }
                  Get.to(Settings.new);
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: _buildDashboardGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      {Widget? icon, String? label, required Function callback}) {
    return InkWell(
      onTap: () => callback(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppTheme.green,
              child: icon,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardGrid() {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 20,
      ),
      childAspectRatio: 16 / 9,
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      mainAxisSpacing: 35,
      children: [
        _buildButton(
          icon: const Icon(
            FontAwesomeIcons.userGroup,
          ),
          label: 'Administration'.tr,
          callback: () {
            Get.to(Administrations.new);
          },
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.video),
          label: 'Media Center'.tr,
          callback: () {
            Get.to(MediaCenter.new);
          },
        ),
        _buildButton(
          icon: const Icon(
            FontAwesomeIcons.buildingUser,
          ),
          label: 'Colleges'.tr,
          callback: () {
            Get.to(Colleges.new);
          },
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.bookOpenReader),
          label: 'Magazine'.tr,
          callback: () {
            Get.to(Magazine.new);
          },
        ),
        _buildButton(
          icon: const Icon(
            FontAwesomeIcons.userGear,
          ),
          label: 'e-services'.tr,
          callback: () {
            Get.to(LoginScreen.new);
          },
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.buildingColumns),
          label: 'About The University'.tr,
          callback: () {
            Get.to(AboutTheUniversity.new);
          },
        ),
        _buildButton(
          icon: const Icon(
            FontAwesomeIcons.addressCard,
          ),
          label: 'Gifted Students Academy'.tr,
          callback: () {
            Get.to(GiftedAcademy.new);
          },
        ),
        _buildButton(
          icon: const Icon(
            FontAwesomeIcons.phoneFlip,
          ),
          label: 'contact_us'.tr,
          callback: () {
            Get.to(GiftedAcademy.new);
          },
        ),
      ],
    );
  }
}

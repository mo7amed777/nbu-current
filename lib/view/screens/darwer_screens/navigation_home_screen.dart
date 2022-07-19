import 'package:get/get.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/screens/article/articles.dart';
import 'package:northern_border_university/view/screens/darwer_screens/about%20US.dart';
import 'package:northern_border_university/view/screens/darwer_screens/feedback_screen.dart';
import 'package:northern_border_university/view/screens/darwer_screens/help_screen.dart';
import 'package:northern_border_university/view/screens/darwer_screens/home_screen.dart';
import 'package:northern_border_university/view/screens/darwer_screens/invite_friend_screen.dart';
import 'package:northern_border_university/view/widgets/custom_drawer/drawer_user_controller.dart';
import 'package:northern_border_university/view/widgets/custom_drawer/home_drawer.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  NavigationHomeScreenState createState() => NavigationHomeScreenState();
}

class NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = Home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexitem) {
              changeIndex(drawerIndexitem);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexitem) {
    if (drawerIndex != drawerIndexitem) {
      drawerIndex = drawerIndexitem;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = Home();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = HelpScreen();
          });
          break;
        case DrawerIndex.About:
          setState(() {
            screenView = AboutUS();
          });
          break;

        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = InviteFriend();
          });
          break;
        case DrawerIndex.Testing:
          getData();
          break;
      }
    }
  }

  void getData() async {
    Article article = Article();
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    await article.getAllItems();
    Get.back();
    setState(() {
      screenView = ArticlesScreen(items: article.items);
    });
  }
}

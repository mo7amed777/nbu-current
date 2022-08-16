import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/controller/functions.dart';
import 'package:northern_border_university/view/screens/darwer_screens/navigation_home_screen.dart';
import 'package:flutter/material.dart';

class MoodDiaryVew extends StatelessWidget {
  final AnimationController animationController;

  const MoodDiaryVew({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final _moodFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _moodSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _imageFirstHalfAnimation =
        Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _imageSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return WillPopScope(
      onWillPop: () {
        showSnackBar(message: 'double press to exit app');
        return Future(
          () => true,
        );
      },
      child: SlideTransition(
        position: _firstHalfAnimation,
        child: SlideTransition(
          position: _secondHalfAnimation,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "N B U",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                SlideTransition(
                  position: _moodFirstHalfAnimation,
                  child: SlideTransition(
                    position: _moodSecondHalfAnimation,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 64,
                        right: 64,
                        top: 8,
                      ),
                      child: Text(
                        "Welcome to NBU just one step to get started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppTheme.lightText,
                        ),
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _imageFirstHalfAnimation,
                  child: SlideTransition(
                    position: _imageSecondHalfAnimation,
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 350, maxHeight: 250),
                      child: Image.asset(
                        'assets/images/introduction_animation/intro3.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 16),
                  child: InkWell(
                    onTap: () {
                      //TODO : Navigate to Gate Home for Surfing without login
                      Get.to(NavigationHomeScreen());
                    },
                    child: Container(
                      height: 58,
                      padding: EdgeInsets.only(
                        left: 56.0,
                        right: 56.0,
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38.0),
                        color: AppTheme.green,
                      ),
                      child: Text(
                        "الـبـوابـة الجـامـعيـة",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 32),
                  child: InkWell(
                    onTap: () {
                      animationController.animateTo(0.8);
                    },
                    child: Container(
                      height: 58,
                      padding: EdgeInsets.only(
                        left: 56.0,
                        right: 56.0,
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38.0),
                        color: AppTheme.green,
                      ),
                      child: Text(
                        "الخدمات الإلكترونية",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

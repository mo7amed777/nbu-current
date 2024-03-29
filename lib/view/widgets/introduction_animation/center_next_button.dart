import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/view/screens/onboard/login/login_screen.dart';

class CenterNextButton extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onNextClick;
  const CenterNextButton(
      {Key? key, required this.animationController, required this.onNextClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _topMoveAnimation =
        Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _signUpMoveAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _loginTextMoveAnimation =
        Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SlideTransition(
          position: _topMoveAnimation,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => AnimatedOpacity(
              opacity: animationController.value >= 0.2 &&
                      animationController.value <= 0.6
                  ? 1
                  : 0,
              duration: Duration(milliseconds: 480),
              child: _pageView(),
            ),
          ),
        ),
        SlideTransition(
          position: _topMoveAnimation,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => Container(
              height: 58,
              width: 58 + (200 * _signUpMoveAnimation.value),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    8 + 32 * (1 - _signUpMoveAnimation.value)),
                color: AppTheme.green,
              ),
              child: PageTransitionSwitcher(
                duration: Duration(milliseconds: 480),
                reverse: _signUpMoveAnimation.value < 0.7,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return SharedAxisTransition(
                    fillColor: AppTheme.transparent,
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.vertical,
                  );
                },
                child: _signUpMoveAnimation.value > 0.7
                    ? InkWell(
                        key: ValueKey('Sign Up button'),
                        onTap: onNextClick,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'login'.tr,
                                style: TextStyle(
                                  color: AppTheme.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(Icons.arrow_forward_rounded,
                                  color: AppTheme.white),
                            ],
                          ),
                        ),
                      )
                    : InkWell(
                        key: ValueKey('next button'),
                        onTap: onNextClick,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: animationController.value >= 0.5
                              ? Icon(Icons.done, color: AppTheme.white)
                              : Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppTheme.white,
                                  textDirection: TextDirection.ltr,
                                ),
                        ),
                      ),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: _loginTextMoveAnimation,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'dont_have_account'.tr,
                  style: TextStyle(
                    color: AppTheme.green,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(() => LoginScreen(
                        key: Key('Sign UP'),
                      )),
                  child: Text(
                    'register'.tr,
                    style: TextStyle(
                      color: AppTheme.lightGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _pageView() {
    int _selectedIndex = 0;

    if (animationController.value >= 0.7) {
      _selectedIndex = 3;
    } else if (animationController.value >= 0.5) {
      _selectedIndex = 2;
    } else if (animationController.value >= 0.3) {
      _selectedIndex = 1;
    } else if (animationController.value >= 0.1) {
      _selectedIndex = 0;
    }

    return _selectedIndex == 2
        ? Container()
        : Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.ltr,
            children: [
              for (var i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 480),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: _selectedIndex == i
                          ? AppTheme.green
                          : AppTheme.lightGreen,
                    ),
                    width: 10,
                    height: 10,
                  ),
                )
            ],
          );
  }
}

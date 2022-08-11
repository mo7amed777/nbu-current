import 'package:get/get.dart';
import 'package:northern_border_university/view/screens/onboard/login/login_screen.dart';
import 'package:northern_border_university/view/screens/onboard/onboard_view.dart';
import 'package:northern_border_university/view/screens/splash/intro_screen1.dart';
import 'package:northern_border_university/view/screens/splash/intro_screen2.dart';
import 'package:northern_border_university/view/screens/splash/intro_screen3.dart';
import 'package:northern_border_university/view/screens/splash/intro_video.dart';
import 'package:northern_border_university/view/widgets/introduction_animation/center_next_button.dart';
import 'package:northern_border_university/view/widgets/introduction_animation/skip_view.dart';
import 'package:flutter/material.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({this.pageNumber = 0.0, this.seconds = 8});
  final double pageNumber;
  final int seconds;
  @override
  _IntroductionAnimationScreenState createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: widget.seconds));
    _animationController?.animateTo(widget.pageNumber);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SplashView(
            animationController: _animationController!,
          ),
          RelaxView(
            animationController: _animationController!,
          ),
          CareView(
            animationController: _animationController!,
          ),
          MoodDiaryVew(
            animationController: _animationController!,
          ),
          WelcomeView(
            animationController: _animationController!,
          ),
          TopBackSkipView(
            onBackClick: _onBackClick,
            onSkipClick: _onSkipClick,
            animationController: _animationController!,
          ),
          CenterNextButton(
            animationController: _animationController!,
            onNextClick: _onNextClick,
          ),
        ],
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.6, duration: Duration(milliseconds: 900));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    Get.to(LoginScreen());
  }
}

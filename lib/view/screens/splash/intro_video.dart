import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:video_player/video_player.dart';

const videoURL =
    'https://www.nbu.edu.sa/sites/default/files/2022-10/Home%20page%20nbu.mp4';

class SplashView extends StatefulWidget {
  final AnimationController animationController;

  const SplashView({Key? key, required this.animationController})
      : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoURL)..setLooping(true);
    _controller.initialize().then((_) {
      setState(() {
        _controller.play();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _introductionanimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _introductionanimation,
      child: Stack(
        children: [
          InkWell(
            onTap: () async {
              if (!_controller.value.isPlaying) await _controller.play();
            },
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            child: InkWell(
              onTap: () {
                _controller.pause();
                widget.animationController.animateTo(0.2);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38.0),
                  color: AppTheme.green,
                ),
                child: Center(
                  child: Text(
                    "getStart".tr,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

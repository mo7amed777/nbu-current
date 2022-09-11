import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/administration_sections.dart';
import 'package:northern_border_university/view/screens/splash/intro_video.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:video_player/video_player.dart';

class Administration extends StatefulWidget {
  const Administration({Key? key}) : super(key: key);

  @override
  State<Administration> createState() => _AdministrationState();
}

class _AdministrationState extends State<Administration> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(VideoURL);

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
            child: Appbar(
                title: 'Administrations',
                onSearch: (val) {},
                search: Icons.search,
                onIconPressed: () {}),
          ),
          Expanded(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Card(
                      elevation: 5.0,
                      margin: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 32.0,
                          right: 8.0,
                          left: 8.0,
                          top: 8.0,
                        ),
                        child: Text(
                          'We aspire to become a distinguished and credible university, recognized for our academic programs that build competency and support research and innovation—and for providing services across the region and the Kingdom. We are a regionally serving, comprehensive university committed to educational excellence. Guided by our core values, heritage, and place, We deliver innovative educational programs characterized by outcomes that leverage the human, economic, cultural, and natural resources for the Northern Borders Region and beyond.',
                          style: TextStyle(
                            fontSize: 16.0,
                            height: 1.5,
                            color: AppTheme.lightText,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 12.0,
                      bottom: 12.0,
                      child: InkWell(
                        onTap: () {
                          _controller.pause();
                          _chewieController.pause();
                          Get.to(() => Administrations());
                        },
                        child: Row(
                          children: const [
                            Text(
                              'view more',
                              style: TextStyle(
                                  color: AppTheme.lightGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.double_arrow,
                              color: AppTheme.lightGreen,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

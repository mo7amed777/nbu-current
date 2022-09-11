import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/Announcements.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/Events.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/News/News.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/PhotoGallery.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/VideoGallery.dart';

class MediaCenterListData {
  MediaCenterListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.icon = FontAwesomeIcons.video,
    required this.callback,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  IconData icon;
  Function callback;

  static List<MediaCenterListData> MediaCenterList = <MediaCenterListData>[
    MediaCenterListData(
      imagePath: 'assets/images/media_center/news.jpg',
      titleTxt: 'NBU News',
      subTxt: 'News in videos, photos and other',
      icon: FontAwesomeIcons.newspaper,
      callback: () => Get.to(() => News()),
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/events.jpg',
      titleTxt: 'Events',
      subTxt: 'Events maybe you interested in',
      icon: FontAwesomeIcons.bookOpen,
      callback: () => Get.to(() => Events()),
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/announcements.jpg',
      titleTxt: 'Announcements',
      subTxt: 'Announcements about things you cares about',
      icon: FontAwesomeIcons.ad,
      callback: () => Get.to(() => Announcements()),
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/photos.png',
      titleTxt: 'Photos',
      subTxt: 'Gallery of NBU events',
      icon: FontAwesomeIcons.photoVideo,
      callback: () => Get.to(() => PhotoGallery()),
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/video.jpg',
      titleTxt: 'Videos',
      subTxt: 'Videos for everything happens in NBU',
      callback: () => Get.to(() => VideoGallery()),
    ),
  ];
}

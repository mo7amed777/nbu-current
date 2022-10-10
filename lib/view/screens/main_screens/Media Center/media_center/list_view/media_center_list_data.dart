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
      titleTxt: 'News'.tr,
      subTxt: 'News in videos, photos and other'.tr,
      icon: FontAwesomeIcons.newspaper,
      callback: () => Get.to(News.new),
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/events.jpg',
      titleTxt: 'Events'.tr,
      subTxt: 'Events maybe you interested in'.tr,
      icon: FontAwesomeIcons.bookOpen,
      callback: () => Get.to(Events.new),
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/announcements.jpg',
      titleTxt: 'Announcements'.tr,
      subTxt: 'Announcements about things you cares about'.tr,
      icon: FontAwesomeIcons.ad,
      callback: () => Get.to(Announcements.new),
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/photos.png',
      titleTxt: 'Photos'.tr,
      subTxt: 'Gallery of NBU events'.tr,
      icon: FontAwesomeIcons.photoVideo,
      callback: () => Get.to(PhotoGallery.new),
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/video.jpg',
      titleTxt: 'Videos'.tr,
      subTxt: 'Videos for everything happens in NBU'.tr,
      callback: () => Get.to(VideoGallery.new),
    ),
  ];
}

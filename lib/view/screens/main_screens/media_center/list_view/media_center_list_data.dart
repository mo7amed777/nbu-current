class MediaCenterListData {
  MediaCenterListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;

  static List<MediaCenterListData> MediaCenterList = <MediaCenterListData>[
    MediaCenterListData(
      imagePath: 'assets/images/media_center/news.jpg',
      titleTxt: 'NBU News',
      subTxt: 'Arar, Saudi Arabia',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/events.jpg',
      titleTxt: 'Events',
      subTxt: 'Arar, Saudi Arabia',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/announcements.jpg',
      titleTxt: 'Announcements',
      subTxt: 'Arar, Saudi Arabia',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/photos.png',
      titleTxt: 'Photos',
      subTxt: 'Arar, Saudi Arabia',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    MediaCenterListData(
      imagePath: 'assets/images/media_center/video.jpg',
      titleTxt: 'Videos',
      subTxt: 'Arar, Saudi Arabia',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];
}

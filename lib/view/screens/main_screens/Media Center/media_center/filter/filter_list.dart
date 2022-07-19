class PopularFilterListData {
  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'Recently Added',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Most Viewed',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Most Liked',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Top Rated',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'No Media Contained',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'All',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Announcements',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Events',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'News',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Videos',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Photos',
      isSelected: false,
    ),
  ];
}

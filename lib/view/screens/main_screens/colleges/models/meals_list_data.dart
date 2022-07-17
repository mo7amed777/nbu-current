class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/images/colleges/runner.png',
      titleTxt: 'Arar',
      kacl: 525,
      meals: <String>['Faculty,', 'Section,', 'More'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    MealsListData(
      imagePath: 'assets/images/colleges/area1.png',
      titleTxt: 'Rafhaa',
      kacl: 602,
      meals: <String>['Faculty,', 'Section,', 'More'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/images/colleges/runner.png',
      titleTxt: 'Turaif',
      kacl: 0,
      meals: <String>['Faculty,', 'Section,', 'More'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/images/colleges/area1.png',
      titleTxt: 'Uweqilya',
      kacl: 0,
      meals: <String>['Faculty,', 'Section,', 'More'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}

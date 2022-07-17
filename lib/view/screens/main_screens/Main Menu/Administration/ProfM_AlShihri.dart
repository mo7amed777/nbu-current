import 'package:flutter/material.dart';

class ProfM_AlShihri extends StatefulWidget {
  const ProfM_AlShihri({Key? key}) : super(key: key);

  @override
  State<ProfM_AlShihri> createState() => _ProfM_AlShihriState();
}

class _ProfM_AlShihriState extends State<ProfM_AlShihri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Prof. Mohammad Al-Shihri'),
        ),
        body: ListView(
          children: [
            Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              child: Column(
                children: const [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage('assets/images/council/members/1.jpg'),
                    ),
                    title: Text(
                      'Professor Mohammad Al-Shihri',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade),
                    ),
                    subtitle: Text(
                      'President',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Office'),
                    subtitle: Text('Room: C-103'),
                  ),
                  ListTile(
                    title: Text('Phone'),
                    subtitle: Text('+971 4 442 6666'),
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(''),
                  ),
                  ListTile(
                    title: Text('Website'),
                    subtitle: Text('www.al-shihri.com'),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              child: Column(
                children: const [
                  ListTile(
                    title: Text('Education & Qualifications'),
                    subtitle: Text('B.Sc. in Computer Science'),
                  ),
                  ListTile(
                    title: Text('Research Interests'),
                    subtitle:
                        Text('Machine Learning, Data Mining, Data Science'),
                  ),
                  ListTile(
                    title: Text('Publications'),
                    subtitle: Text(
                        '1. A. Al-Shihri, A. Al-Shihri, and M. Al-Shihri. “A Novel Approach to Predicting the Probability of a Patient”, in Proceedings of the International Conference on Data Mining, Data Visualization and Knowledge Discovery, pp. 1-6, 2016.'),
                  ),
                  ListTile(
                    title: Text('Awards'),
                    subtitle: Text(
                        '1. Best Paper Award, International Conference on Data Mining, Data Visualization and Knowledge Discovery, 2016.'),
                  ),
                  ListTile(
                    title: Text('Courses'),
                    subtitle: Text(
                        '1. Data Mining, Data Visualization and Knowledge Discovery, 2016.'),
                  ),
                  ListTile(
                    title: Text('Publications'),
                    subtitle: Text(
                        '1. A. Al-Shihri, A. Al-Shihri, and M. Al-Shihri. “A Novel Approach to Predicting the Probability of a Patient”, in Proceedings of the International Conference on Data Mining, Data Visualization and Knowledge Discovery, pp. 1-6, 2016.'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

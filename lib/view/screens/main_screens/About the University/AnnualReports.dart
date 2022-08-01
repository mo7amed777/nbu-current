import 'package:flutter/material.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:northern_border_university/view/widgets/download_card.dart';

class AnnualReports extends StatefulWidget {
  const AnnualReports({Key? key}) : super(key: key);

  @override
  State<AnnualReports> createState() => _AnnualReportsState();
}

class _AnnualReportsState extends State<AnnualReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Appbar(
              title: 'Annual Reports',
              onIconPressed: () {},
              search: false,
              view: false,
              onSearch: () {},
            ),
          ),
          DownloadCard(
              title: 'التقرير السنوي للعام الجامعي 1436 – 1437 هـ ',
              download: () {}),
          DownloadCard(
              title: 'التقرير السنوي للعام الجامعي 1437 – 1438 هـ',
              download: () {}),
          DownloadCard(
              title: 'التقرير السنوي للعام الجامعي 1438 – 1439 هـ',
              download: () {}),
          DownloadCard(
              title: 'التقرير السنوي للعام الجامعي 1439 – 1440 هـ',
              download: () {}),
          DownloadCard(
              title: 'التقرير السنوي للعام الجامعي 1440 - 1441 هـ',
              download: () {}),
        ],
      ),
    );
  }
}

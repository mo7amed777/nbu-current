import 'package:get/get.dart';
import 'package:northern_border_university/view/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../../../controller/app_theme.dart';
import '../Administration/administration_sections.dart';
import 'MoreAboutTheUniversity.dart';

class AboutTheUniversity extends StatefulWidget {
  const AboutTheUniversity({Key? key}) : super(key: key);

  @override
  State<AboutTheUniversity> createState() => _AboutTheUniversityState();
}

class _AboutTheUniversityState extends State<AboutTheUniversity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text('About the University',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.green,
                                fontSize: 16)),
                      ),
                      Text(
                        'Being the only university in the Northern Borders Region, Northern Border University enjoys a unique position in higher education in Saudi Arabia, which is why it holds the name of this precious region. The university plans are inspired by the region\'s rich values, culture, history, and location. We also ensure that our Strategic Plan 2020-2025 goes along with the region\'s rich natural resources, Vision 2030, and with the New University System, guided by the strategic priorities of the Northern Borders Region\'s Emirate.',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: AppTheme.lightText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 12.0,
                bottom: 12.0,
                child: InkWell(
                  onTap: () => Get.to(MoreAboutTheUniversity()),
                  child: Row(
                    children: [
                      Text(
                        'view more',
                        style: TextStyle(
                            color: AppTheme.lightGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
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
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text('University\'s History',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.green,
                  fontSize: 20,
                )),
          ),
          Timeline(
            position: TimelinePosition.Left,
            physics: NeverScrollableScrollPhysics(),
            iconSize: 25,
            lineColor: AppTheme.lightText,
            shrinkWrap: true,
            //if itemCount increases, u also need to increase the height of the timeline
            children: [
              timelineModel('1402 AH',
                  'The Middle College for Girls was established and served as the foundation of this current edifice.'),
              timelineModel('1408 AH',
                  'The Middle College for Girls was turned into The Teachers\' College, awarding Bachelor\'s degrees to its students for the first time.'),
              timelineModel('1426 AH',
                  'The College of Science in Arar and  Rafha\'s Community College were established to be two branches of King Abdulaziz University.'),
              timelineModel('1428 AH',
                  "During his historic visit to the Northern Border Region, the Custodian of the Two Holy Mosques, King Abdullah bin Abdulaziz (may Allah have mercy on him), announced The Royal Decree to establish Northern Borders University. It merged The Teachers' College with the two branches of King Abdulaziz University, both in Arar and Rafha. The establishment of Northern Borders University was immediately followed by establishing several new colleges. These colleges were; The College of Medicine, Pharmacy, Nursing, Applied Medical Sciences, Engineering, Computer Science, Business Administration, and Community College, all of which were distributed around its main campus in Arar. Alongside the three branches of the university in Rafha, Tarif, and Al Uwayqila. The emerging university has undergone a period of rapid development. It has been a significant part of the transformation of cultural, social, and economic progress in the region"),
            ],
          ),
        ],
      ),
    );
  }
}

TimelineModel timelineModel(String title, String subtitle) {
  return TimelineModel(
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.green,
                        fontSize: 20)),
              ),
              Text(subtitle,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.lightText,
                      overflow: TextOverflow.fade)),
            ],
          ),
        ),
      ),
      icon: Icon(
        Icons.history,
        color: AppTheme.white,
      ),
      iconBackground: AppTheme.lightGreen);
}

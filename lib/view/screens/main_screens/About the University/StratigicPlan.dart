import 'package:northern_border_university/view/widgets/download_card.dart';
import 'package:flutter/material.dart';

class StratigicPlan extends StatefulWidget {
  const StratigicPlan({Key? key}) : super(key: key);

  @override
  State<StratigicPlan> createState() => _StratigicPlanState();
}

class _StratigicPlanState extends State<StratigicPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20),
          DownloadCard(
              title: 'الخطة الإستراتيجية لجامعة الحدود الشمالية',
              download: () {}),
          DownloadCard(
              title: 'Northern Border University Strategic Plan',
              download: () {}),
        ],
      ),
    );
  }
}

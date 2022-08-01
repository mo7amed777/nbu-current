import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:northern_border_university/view/widgets/list_items.dart';
import 'package:flutter/material.dart';
import 'package:northern_border_university/view/widgets/list_tile.dart';

class VisionandGoals extends StatefulWidget {
  const VisionandGoals({Key? key}) : super(key: key);

  @override
  State<VisionandGoals> createState() => _VisionandGoalsState();
}

class _VisionandGoalsState extends State<VisionandGoals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Appbar(
              title: 'Vision and Goals',
              onIconPressed: () {},
              search: false,
              view: false,
              onSearch: () {},
            ),
          ),
          MyListTile(
            title: 'Vision',
            subtitle:
                'We aspire to become a distinguished and credible university, recognized for our academic programs based on building competency, research, innovation, and providing services across the region and the Kingdom.',
          ),
          MyListTile(
            title: 'Mission',
            subtitle:
                'We are a regionally serving, comprehensive university committed to educational excellence. Guided by our core values, heritage, and place, We deliver innovative educational programs characterized by outcomes that leverage the human, economic, cultural, and natural resources for the Northern Borders Region and beyond.',
          ),
          ListItems(
              title: 'Goals',
              items: const [
                'Providing excellent education that sharpens intellect and professionalism.',
                'Stimulating research and innovation following the university’s research priorities.',
                'Developing community partnership. ',
                'Developing an administrative and financial system that enhances management efficiency and diversifies sources of income.',
              ],
              icon: Icons.check),
        ],
      ),
    );
  }
}

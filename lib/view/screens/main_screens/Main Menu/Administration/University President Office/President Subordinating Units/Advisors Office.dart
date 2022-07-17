import 'package:northern_border_university/view/widgets/list_items.dart';
import 'package:northern_border_university/view/widgets/list_tile.dart';
import 'package:flutter/material.dart';

class AdvisorsOffice extends StatefulWidget {
  const AdvisorsOffice({Key? key}) : super(key: key);

  @override
  State<AdvisorsOffice> createState() => _AdvisorsOfficeState();
}

class _AdvisorsOfficeState extends State<AdvisorsOffice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          MyListTile(
              title: 'Goal',
              subtitle:
                  "To provide advisory services to the President in the areas of interest to the university."),
          ListItems(
            title: 'Tasks: ',
            items: [
              "Prepare the office’s activities plans and follow up on their implementation after approval.",
              "Facilitate obtaining data and information by advisors in specialized units.",
              "Receive advisors’ reports, print them, organize, and present them to the President.",
              "Follow up on advisors’ contracts and notify the President of any new developments regarding them.",
              "Coordinate visits and make necessary reservations for advisors with the relevant units.",
              "Present advisors’ performance evaluation results regularly to them and the President.",
              "Disburse advisors’ rewards and follow up on financial matters with the Financial Affairs Department.",
              "Determine the office’s needs regarding human resources, equipment, and materials, and follow up on their provision.",
              "Determine the training needs of the office staff to nominate them for the appropriate training programs.",
              "Prepare periodic reports on the office’s activities, achievements, and proposals to develop performance.",
              "Do any other tasks assigned to it within its limits.",
            ],
          ),
        ],
      ),
    );
  }
}

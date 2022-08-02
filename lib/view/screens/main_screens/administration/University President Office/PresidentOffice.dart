import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/President%20Subordinating%20Units/PresidentSubordinatingUnits.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/members.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:northern_border_university/view/widgets/list_items.dart';
import 'package:northern_border_university/view/widgets/list_tile.dart';
import 'package:flutter/material.dart';

class UniversityPresidentOffice extends StatefulWidget {
  const UniversityPresidentOffice({Key? key}) : super(key: key);

  @override
  State<UniversityPresidentOffice> createState() =>
      _UniversityPresidentOfficeState();
}

class _UniversityPresidentOfficeState extends State<UniversityPresidentOffice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Appbar(
              title: 'University President Office',
              onIconPressed: () {
                Get.to(OfficeMembers());
              },
              search: false,
              view: true,
              icon: FontAwesomeIcons.userFriends,
              onSearch: () {},
            ),
          ),
          Stack(
            children: [
              Card(
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 2.0,
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text('About The Office',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.lightText,
                            fontSize: 16)),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(
                      bottom: 32.0,
                    ),
                    child: Text(
                      "The University President’s Office is the link between High Management and all academic, administrative, and technical bodies of the university. The office is connected to several departments and sub-departments whose work is integrated to complete transactions of different university bodies, the local community, and various public and private sectors in Saudi Arabia.",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, height: 1.5),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 12.0,
                bottom: 12.0,
                child: InkWell(
                  onTap: () {
                    Get.to(PresidentSubordinatingUnits());
                  },
                  child: Row(
                    children: const [
                      Text(
                        'view more',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Icon(
                        Icons.double_arrow,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          MyListTile(
            title: 'Vision',
            subtitle: "Quality and Excellence in Administrative Services.",
          ),
          MyListTile(
            title: 'Mission',
            subtitle:
                "We aspire for excellence in administrative work that enhances the role of the University President’s Office in efficiently communicating with beneficiaries and different sectors of the university.",
          ),
          ListItems(title: "Goals ", items: const [
            "Enhance communication between the university’s high administration and other sectors.",
            "Provide an outstanding level of services for beneficiaries. ",
            "Achieve efficiency with the president’s office’s transactions.",
            "Support the high administration decision-making. ",
            "Facilitate necessary procedures for beneficiaries. ",
            "Simplify administrative services procedures. ",
            "Develop an administrative cadre in the president’s office. ",
            "Employ e-transactions in the office and with beneficiaries. ",
            "Ensure Continuous improvement of the office in accordance with the university’s academic development requirements.",
          ]),
        ],
      ),
    );
  }
}

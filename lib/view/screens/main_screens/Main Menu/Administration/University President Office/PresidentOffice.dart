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
        children: const <Widget>[
          MyListTile(
              title: 'About The Office',
              subtitle:
                  "The University President’s Office is the link between High Management and all academic, administrative, and technical bodies of the university. The office is connected to several departments and sub-departments whose work is integrated to complete transactions of different university bodies, the local community, and various public and private sectors in Saudi Arabia."),
          MyListTile(
            title: 'Vision',
            subtitle: "Quality and Excellence in Administrative Services.",
          ),
          MyListTile(
            title: 'Mission',
            subtitle:
                "We aspire for excellence in administrative work that enhances the role of the University President’s Office in efficiently communicating with beneficiaries and different sectors of the university.",
          ),
          ListItems(title: "Goals ", items: [
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

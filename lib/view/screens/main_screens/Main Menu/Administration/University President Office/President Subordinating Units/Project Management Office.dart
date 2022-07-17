import 'package:northern_border_university/view/widgets/list_items.dart';
import 'package:northern_border_university/view/widgets/list_tile.dart';
import 'package:flutter/material.dart';

class ProjectManagementOffice extends StatefulWidget {
  const ProjectManagementOffice({Key? key}) : super(key: key);

  @override
  State<ProjectManagementOffice> createState() =>
      _ProjectManagementOfficeState();
}

class _ProjectManagementOfficeState extends State<ProjectManagementOffice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          MyListTile(
              title: "About Project Management Office:",
              subtitle:
                  "The office was established based on the decision of His Excellency, the President of the University No. 420000918 dated 06/24/1441 AH, to form the University’s Project Management Office. The Project Management Office (PMO) is directly linked to the President of the University.​"),
          ListItems(
            title: "Tasks:",
            items: const [
              "Manage and follow up on the university’s programs and projects to achieve the vision, mission, and goals of the university’s Strategic Plan and quality assurance. ",
              "Lay the methodology for working between the Project Management Office and different university entities. ",
              "List needs and requirements necessary for the university’s entities and provide them successively in coordination with competent",
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12.0),
            child: Text(
              "Organizational Structure",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green[800],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              "Members",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green[800],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 64.0,
                children: const [
                  Text('Dr. Mohammed Mohsen bin Ammar'),
                  Text('Head'),
                  Text('Mr. Sultan bin Faisal Al-Otaibi	'),
                  Text('Director'),
                  Text('Prof. Ibrahim Elbagoury	'),
                  Text('Head of Project Management ِAdministration'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              "Achievements",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green[800],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 8.0),
            child: Text(
              "Projects",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildListItem(
                      number: '1',
                      subtitle:
                          "Project Management Office’s Internal Administrative and Procedural Management"),
                  _buildListItem(
                      number: '2',
                      subtitle:
                          "Project Management Office’s Internal Administrative and Procedural Management"),
                  _buildListItem(
                      number: '3',
                      subtitle:
                          "Project Management Office’s Internal Administrative and Procedural Management"),
                ],
              ),
            ),
          ),
          ListItems(title: 'Current projects: ', items: const [
            "Lay the methodology for working between the Project Management Office and different university entities to manage projects/initiatives of the Strategic Plan 2020-2025. ",
            "Lay the methodology for working between the Project Management Office and different university entities to manage projects/initiatives of the Strategic Plan 2020-2025. ",
            "Lay the methodology for working between the Project Management Office and different university entities to manage projects/initiatives of the Strategic Plan 2020-2025. ",
            "Lay the methodology for working between the Project Management Office and different university entities to manage projects/initiatives of the Strategic Plan 2020-2025. ",
            "Lay the methodology for working between the Project Management Office and different university entities to manage projects/initiatives of the Strategic Plan 2020-2025. ",
            "Lay the methodology for working between the Project Management Office and different university entities to manage projects/initiatives of the Strategic Plan 2020-2025. ",
            "Lay the methodology for working between the Project Management Office and different university entities to manage projects/initiatives of the Strategic Plan 2020-2025. ",
          ]),
        ],
      ),
    );
  }

  Widget _buildListItem({required String number, required String subtitle}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          '$number. $subtitle',
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

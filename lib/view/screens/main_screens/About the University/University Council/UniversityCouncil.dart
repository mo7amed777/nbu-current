// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:northern_border_university/view/widgets/list_items.dart';
import 'package:flutter/material.dart';

class UniversityCouncil extends StatefulWidget {
  const UniversityCouncil({Key? key}) : super(key: key);

  @override
  State<UniversityCouncil> createState() => _UniversityCouncilState();
}

class _UniversityCouncilState extends State<UniversityCouncil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Appbar(
              title: 'The University Council',
              search: Icons.search,
              onSearch: () {},
            ),
          ),
          Card(
            margin: EdgeInsets.all(12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 2.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'The University Council is the highest authority in all university-related matters and issues. It is headed by the Minister of Higher Education with the University President (as Vice President), the University Vice Presidents, the Secretary-General of the Higher Education Council, the college deans, and three experienced persons appointed by His Excellency the Minister of Higher Education for a three-year term (pursuant to article 19 of the Higher Education and Universities Council Regulation).',
                style: TextStyle(
                  height: 1.5,
                ),
              ),
            ),
          ),
          ListItems(
            title: "Council's Organization",
            items: [
              'University Council assembles at least once a month. Meetings are valid only if two-thirds of the Council members attend.',
              'Resolutions of the Council pass by the majority vote of the members in session. In case of a tie, the side on which the President or the Vice President vote will prevail.',
              "Resolutions of the Council will be regarded as executable unless objected to by His Excellency the Minister of Higher Education within fifteen (15) days after delivering them to him. In case of rejection, the rejected resolution will be returned to the Council with The Minister's point of view for reconsideration. If the Council upholds its opinion, the resolution will be directed to the Higher Education Council to study in a regular or an extraordinary session. The Higher Education Council may uphold, amend, or revoke the resolution. The related decision of the Council will be final and binding.",
            ],
          ),
          ListItems(
            title: "Duties and Powers of the Council",
            items: [
              "Approve the training and external scholarships plan.",
              "Propose establishing new faculties, institutions, divisions, research centers, support deanships, and suggest renaming, merging, or terminating them.",
              "Approve academic majors and graduate programs.",
              "Award academic degrees to students.",
              "Award honorary degrees.",
              "Set the academic calendar following the academic year's duration and specify holidays and leaves.",
              "Arrange training or secondment of academic staff, assign academic duties, grant them study leaves, and terminate their contracts following rules and regulations.",
              "Approve curricula, study plans, books, and references based on the proposals submitted by faculties and institutions.",
              "Propose academic awards and stipends for students.",
              "Approve the university's budget draft before submission to the  Minister of Higher Education.",
              "Endorse and approve the university's internal rules and regulations, not including financial benefits or otherwise.",
              "Amend the university's rules and regulations.",
              "Discuss the annual report before submission to the Higher Education Council.",
              "Determine appropriations for each college, institute, deanship, and independent research center within the limits and restrictions of the financial rules and regulations.",
              "Discuss the university's submission preparation to the President of the Council of Ministers.",
              "Approve the university's extracurricular activity plans.",
              "Resolve the assignment of faculty members based on the recommendations of the Academic Council.",
              "Accept donations and gifts provided that they do not contradict the university's core purpose.",
              "Set rules for visiting or transferring students in or out of the university.",
              "Discuss matters presented to The Council by The Minister of Higher Education, The President, The Vice President, or any of The Council members.",
              "Form permanent or temporary council committees to study assigned matters.",
            ],
            subtitle:
                "Pursuant to article 20 of the Higher Education and Universities Regulations, the University Council attends to its academic, administrative, and financial affairs and ensures that its general policy is implemented. To this end, it will: ",
          ),
          ListItems(
            title: "Secretariat of the University Council",
            items: [
              "Prepare The Council meetings by coordinating suitable dates with the Secretariat General of the Higher Education Council- Prepare and transmit invitations and agenda to the Council members via emails.",
              "Prepare, print, proofread and submit the agenda to His Excellency the Minister of Higher Education and Chairman of the University Council for approval.",
              "Prepare and transmit the executive letters on the recommendations and resolutions of the Council.",
              "Ensure compliance with the decisions, rules and regulations related to the issues presented to the Council.",
              "Print and distribute all correspondence related to the Council to the relevant bodies of the university.",
              "Archive meetings reports and files of the Council electronically.",
              "Supervise the Secretariat and its personnel affairs.",
              "Respond to all inquiries received in writing, electronically, or by telephone and provide the concerned university's bodies with rules, regulations, and forms.",
            ],
            subtitle:
                "This executive committee facilitates the University Council's duties by providing management and administrative services according to the Council and High Administration rules. The Secretariat is supervised by The University Council Secretary, whom The Minister of Higher Education appoints upon the recommendation of The Council to one of its members.",
          ),
        ],
      ),
    );
  }
}

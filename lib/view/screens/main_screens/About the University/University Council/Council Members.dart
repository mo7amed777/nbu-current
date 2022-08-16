import 'package:flutter/material.dart';

import '../../../../../controller/app_theme.dart';

class CouncilMembers extends StatefulWidget {
  const CouncilMembers({Key? key}) : super(key: key);

  @override
  State<CouncilMembers> createState() => _CouncilMembersState();
}

class _CouncilMembersState extends State<CouncilMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          member(
              name: 'Dr. Ayed bin Ayedh A-Ruwaili',
              index: 1,
              description:
                  'Secretary of the Council ayed.alruwaili@nbu.edu.sa'),
          member(
              name: 'Mr. Turki Abdullah Al-Ahmari',
              index: 2,
              description:
                  'Assistant of Council Secretary Turki.alahmary@nbu.edu.sa'),
          member(
              name: 'Mr. Mansour Rumayd Al-Anzi',
              index: 3,
              description:
                  'Director of the Administrative Affairs Unit of Council secretariat Mansoor.Romidh@nbu.edu.sa'),
        ],
      ),
    );
  }
}

Widget member({
  required String name,
  required int index,
  required String description,
}) =>
    Card(
      child: Column(
        children: [
          Image.asset('assets/images/council/members/$index.jpg',
              height: 200, width: 200, fit: BoxFit.contain),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            subtitle: Text(description,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.lightText)),
          ),
        ],
      ),
    );

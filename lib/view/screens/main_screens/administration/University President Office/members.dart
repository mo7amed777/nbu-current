import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/view/widgets/expandTile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OfficeMembers extends StatefulWidget {
  const OfficeMembers({Key? key}) : super(key: key);

  @override
  State<OfficeMembers> createState() => _OfficeMembersState();
}

class _OfficeMembersState extends State<OfficeMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ExpandedTile(
              mainTitle: 'Dr. Mufdi bin Ratian Al-Sharari',
              title: "General Supervisor Of The University President's Office",
              TwoItemsRow: const [
                '​mufadhi.alsharari@nbu.edu.sa',
                '0146614001',
              ],
              onTap: () {
                callByPhoneOrEmail(
                    name: 'Dr. Mufdi bin Ratian Al-Sharari',
                    phoneNumber: '0146614001',
                    email: "​mufadhi.alsharari@nbu.edu.sa");
              },
            ),
            ExpandedTile(
              mainTitle: 'Hamoud bin Melfi Al-Anzi',
              title: "Director Of The University President's Office",
              TwoItemsRow: const [
                '​hmod.alenazi@nbu.edu.sa',
                '0146614002',
              ],
              onTap: () {
                callByPhoneOrEmail(
                    name: 'Dr. Mufdi bin Ratian Al-Sharari',
                    phoneNumber: '0146614001',
                    email: "​mufadhi.alsharari@nbu.edu.sa");
              },
            ),
            ExpandedTile(
              mainTitle: '​Adel bin Abdullah Al-Ahmari	',
              title: "Secret Office Manager",
              TwoItemsRow: const [
                '​aalahmary@nbu.edu.sa',
                '0146614007',
              ],
              onTap: () {
                callByPhoneOrEmail(
                    name: 'Dr. Mufdi bin Ratian Al-Sharari',
                    phoneNumber: '0146614001',
                    email: "​mufadhi.alsharari@nbu.edu.sa");
              },
            ),
            ExpandedTile(
              mainTitle: 'Rayan bin Abdul-Wahhab Al-Sharif',
              title: "Secretary Of The University President",
              TwoItemsRow: const [
                '​Rayan.Alsharif@nbu.edu.sa',
                '0146614005',
              ],
              onTap: () {
                callByPhoneOrEmail(
                    name: 'Dr. Mufdi bin Ratian Al-Sharari',
                    phoneNumber: '0146614001',
                    email: "​mufadhi.alsharari@nbu.edu.sa");
              },
            ),
            ExpandedTile(
              mainTitle: 'Issa bin Mohammed Sharif',
              title: "Administrative Communications Unit",
              TwoItemsRow: const [
                '​Sharif@nbu.edu.sa',
                '​0146614008',
              ],
              onTap: () {
                callByPhoneOrEmail(
                    name: 'Dr. Mufdi bin Ratian Al-Sharari',
                    phoneNumber: '0146614001',
                    email: "​mufadhi.alsharari@nbu.edu.sa");
              },
            ),
            ExpandedTile(
              mainTitle: 'Saleh bin Rashid Al-Banaqi',
              title: "Administrative Communications Unit",
              TwoItemsRow: const [
                '​Saleh.Albannagi@nbu.edu.sa',
                '​0144615453',
              ],
              onTap: () {
                callByPhoneOrEmail(
                    name: 'Dr. Mufdi bin Ratian Al-Sharari',
                    phoneNumber: '0146614001',
                    email: "​mufadhi.alsharari@nbu.edu.sa");
              },
            ),
            ExpandedTile(
              mainTitle: 'Musa bin Hattab Al-Hazmi',
              title: "Administrative Communications Unit",
              TwoItemsRow: const [
                'Not Available',
                '0144614006',
              ],
              onTap: () {
                callByPhoneOrEmail(
                    name: 'Musa bin Hattab Al-Hazmi',
                    phoneNumber: '0146614001',
                    email: "Not Available");
              },
            ),
            ExpandedTile(
              mainTitle: '​Ali bin Sukran Al-Anzi',
              title: "Administrative Communications Unit",
              TwoItemsRow: const [
                'Not Available',
                'Not Available',
              ],
              onTap: () {
                //check if phoneNumber & email are available
                // if YES then callByPhoneOrEmail
                // if NO then show a Toast
                Fluttertoast.showToast(
                    msg: "Contact info is not available",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 18.0);
              },
            ),
            ExpandedTile(
              mainTitle: 'Badr bin Ayed Al-Hazimi',
              title: "Administrative Communications Unit",
              TwoItemsRow: const [
                'Not Available',
                'Not Available',
              ],
              onTap: () {
                //check if phoneNumber & email are available
                // if YES then callByPhoneOrEmail
                // if NO then show a Toast
                Fluttertoast.showToast(
                    msg: "Contact info is not available",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 18.0);
              },
            ),
          ],
        ),
      ),
    );
  }

  void callByPhoneOrEmail({
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    Get.defaultDialog(
      title: 'Calling...',
      titleStyle: TextStyle(color: Colors.blue),
      content: Text(name, style: TextStyle(color: Colors.blue)),
      actions: [
        phoneNumber != 'Not Available'
            ? TextButton(
                child: Text('Phone'),
                onPressed: () async {
                  Get.back();
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: phoneNumber,
                  );
                  await launchUrl(launchUri);
                },
              )
            : Container(),
        email != 'Not Available'
            ? TextButton(
                child: Text('Email'),
                onPressed: () async {
                  Get.back();
                  final Uri launchUri = Uri(
                    scheme: 'mailto',
                    path: email,
                  );
                  await launchUrl(launchUri);
                },
              )
            : Container(),
      ],
    );
  }
}

import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';

class UniversityPresident extends StatefulWidget {
  const UniversityPresident({Key? key}) : super(key: key);

  @override
  State<UniversityPresident> createState() => _UniversityPresidentState();
}

class _UniversityPresidentState extends State<UniversityPresident> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 100,
                backgroundImage:
                    AssetImage('assets/images/council/members/1.jpg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'The University President',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Prof. Mohammed bin Yahya Al-Shehri',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'The University President is the head of the University. He/She is responsible for the University’s operations, finances, and administration. The University President is also responsible for the University’s policies and procedures, as well as for the University’s financial and administrative records. The University President is also responsible for the University’s financial and administrative records.',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

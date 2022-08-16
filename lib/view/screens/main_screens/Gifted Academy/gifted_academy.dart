import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/view/screens/main_screens/Gifted%20Academy/programs.dart';
import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class GiftedAcademy extends StatefulWidget {
  @override
  GiftedAcademyState createState() => GiftedAcademyState();
}

class GiftedAcademyState extends State<GiftedAcademy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/gifted_academy/talented_acadamy_logo.jpg',
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text(
                  "The Gifted Students Academy is an initiative of the Northern Border University's Strategic Plan 2020-2025, that comes to achieve the university's strategic direction in exploring, attracting, and nurturing talented students in an attractive educational environment that stimulates creativity and innovation; building them to be influential leaders in the Kingdom's development. The Academy is proud to offer many programs and initiatives aimed at gifted students in General and University Education.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: AppTheme.lightText),
                ),
              ),
              InkWell(
                onTap: () => Get.to(Programs()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'view more',
                      style: TextStyle(
                          color: AppTheme.lightGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Icon(
                      Icons.double_arrow,
                      color: AppTheme.lightGreen,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Zoom(
                  maxZoomWidth: 1800,
                  maxZoomHeight: 1800,
                  initZoom: 0.0,
                  backgroundColor: AppTheme.white,
                  child: Image.asset(
                    'assets/images/gifted_academy/program.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

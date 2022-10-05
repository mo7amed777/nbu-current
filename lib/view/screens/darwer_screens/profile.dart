// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/view/screens/settings/profilesettings.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.transparent,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                'assets/images/media/profile_back.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    textDirection: TextDirection.ltr,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Student Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      InkWell(
                                          onTap: () => Get.to(EditPage.new),
                                          child: Icon(
                                            FontAwesomeIcons.edit,
                                            color: AppTheme.green,
                                          )),
                                    ],
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text('medicine'.tr),
                                    subtitle: Text("arar".tr),
                                    textColor: AppTheme.lightText,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "285",
                                        style: TextStyle(
                                          color: AppTheme.lightText,
                                        ),
                                      ),
                                      Text(
                                        "Likes",
                                        style: TextStyle(
                                          color: AppTheme.lightText,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "3025",
                                        style: TextStyle(
                                          color: AppTheme.lightText,
                                        ),
                                      ),
                                      Text(
                                        "Comments",
                                        style: TextStyle(
                                          color: AppTheme.lightText,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "650",
                                        style: TextStyle(
                                          color: AppTheme.lightText,
                                        ),
                                      ),
                                      Text(
                                        "Favourites",
                                        style: TextStyle(
                                          color: AppTheme.lightText,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/media/userImage.png'),
                                fit: BoxFit.cover)),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("std_info".tr),
                          textColor: AppTheme.green,
                        ),
                        Divider(),
                        ListTile(
                          title: Text("email".tr),
                          subtitle: Text("student@gmail.com"),
                          leading: Icon(color: AppTheme.green, Icons.email),
                          textColor: AppTheme.lightText,
                        ),
                        ListTile(
                          title: Text("phone".tr),
                          subtitle: Text("+966-5815225566"),
                          leading: Icon(color: AppTheme.green, Icons.phone),
                          textColor: AppTheme.lightText,
                        ),
                        ListTile(
                          title: Text("website".tr),
                          subtitle: Text("https://www.student_profile.com"),
                          leading: Icon(color: AppTheme.green, Icons.web),
                          textColor: AppTheme.lightText,
                        ),
                        ListTile(
                          title: Text("about".tr),
                          subtitle: Text(
                              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab."),
                          leading: Icon(color: AppTheme.green, Icons.person),
                          textColor: AppTheme.lightText,
                        ),
                        ListTile(
                          title: Text("joined_date".tr),
                          subtitle: Text("15 February 2019"),
                          leading: Icon(
                              color: AppTheme.green, Icons.calendar_view_day),
                          textColor: AppTheme.lightText,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppBar(
              backgroundColor: AppTheme.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}

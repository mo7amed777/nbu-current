import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/ContactUS.dart';

class AboutUS extends StatefulWidget {
  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    bottom: MediaQuery.of(context).size.height * 0.05,
                    left: 16,
                    right: 16),
                child: Image.asset('assets/images/media/about_template.jpg'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'who_we_are'.tr,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.green,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: const Text(
                  //Not translated it comes from NBU Portal API
                  "Northern Border University (NBU) is located in Arar, Saudi Arabia. It was founded in 2007.[1][2] It contains 16 colleges: 9 in Arar, 4 in Rafha, 2 in Turayf, and 1 in Al Uwayqilah.[3] It has a variety of majors in multiple levels, including bachelor's and master's degrees",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, height: 1.5, color: AppTheme.lightText),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.green,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.nearlyBlack.withOpacity(0.3),
                              offset: const Offset(4, 4),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: Material(
                        color: AppTheme.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.to(ContactUS.new);
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    'contact_us'.tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.phone_enabled,
                                  color: AppTheme.white,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

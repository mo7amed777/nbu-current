import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/view/screens/settings/profilesettings.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool _dark;

  @override
  void initState() {
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : AppTheme.background,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme:
              IconThemeData(color: _dark ? AppTheme.white : AppTheme.green),
          backgroundColor: AppTheme.transparent,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios), onPressed: (Get.back)),
          title: Text(
            'settings'.tr,
            style: TextStyle(color: _dark ? AppTheme.white : AppTheme.green),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.moon),
              onPressed: () {
                setState(() {
                  _dark = !_dark;
                });
              },
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: AppTheme.green,
                    child: ListTile(
                      onTap: () {
                        //open edit profile
                        Get.to(EditPage.new);
                      },
                      title: Text(
                        "إسم الطالب",
                        style: TextStyle(
                          color: AppTheme.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/magazine/userImage.png'),
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline,
                            color:
                                _dark ? AppTheme.nearlyWhite : AppTheme.green,
                          ),
                          title: Text("change_password".tr),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change password
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.language,
                            color:
                                _dark ? AppTheme.nearlyWhite : AppTheme.green,
                          ),
                          title: Text("change_language".tr),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            if (Get.locale == Locale('en_US')) {
                              Get.updateLocale(Locale('ar_SA'));
                            } else {
                              Get.updateLocale(Locale('en_US'));
                            }
                            setState(() {});
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color:
                                _dark ? AppTheme.nearlyWhite : AppTheme.green,
                          ),
                          title: Text("change_location".tr),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change location
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Notification Settings".tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.green,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: AppTheme.green,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Received Notification".tr),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: AppTheme.green,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Received App Updates".tr),
                    onChanged: null,
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 00,
              left: 00,
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.powerOff,
                  color: AppTheme.white,
                ),
                onPressed: () {
                  //log out
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: AppTheme.green,
    );
  }
}

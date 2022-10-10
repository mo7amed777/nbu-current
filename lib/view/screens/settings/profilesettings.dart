import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/functions.dart';
import 'package:northern_border_university/controller/app_theme.dart';

class ProfileSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditPage(),
    );
  }
}

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool showPassword = false;
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.background,
        iconTheme: IconThemeData(color: AppTheme.green),
        title: Text(
          "Edit Profile".tr,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: AppTheme.green),
        ),
      ),
      body: Container(
        color: AppTheme.background,
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: AppTheme.nearlyBlack.withOpacity(0.3),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: result != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(result!.files.single.path!),
                                ),
                              )
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/magazine/userImage.png',
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: AppTheme.green,
                          ),
                          child: InkWell(
                            onTap: () async {
                              result = await FilePicker.platform.pickFiles(
                                type: FileType.image,
                                allowMultiple: false,
                              );
                              if (result != null) {
                                setState(() {
                                  showSnackBar(
                                      message:
                                          'Profile photo updated successfully.'
                                              .tr);
                                });
                              }
                            },
                            child: Icon(
                              Icons.edit,
                              color: AppTheme.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              buildTextField("الإسم بالكامل", "إسم الطالب", false),
              buildTextField("البريد الإلكتروني", "student@gmail.com", false),
              buildTextField("كلمة المرور", "********", true),
              buildTextField("الموقع", "عرعر", false),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      backgroundColor: AppTheme.nearlyBlack,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {},
                    child: Text("CANCEL".tr,
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: AppTheme.white)),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: AppTheme.green,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                    ),
                    child: Text(
                      "SAVE".tr,
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: AppTheme.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: AppTheme.green,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.green,
            )),
      ),
    );
  }
}

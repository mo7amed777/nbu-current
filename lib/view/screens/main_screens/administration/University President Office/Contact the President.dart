import 'dart:io';
import 'package:northern_border_university/controller/functions.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:northern_border_university/view/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:northern_border_university/view/widgets/my_button.dart';

import '../../../../../../controller/themes/app_theme.dart';

class ContactPresident extends StatefulWidget {
  const ContactPresident({Key? key}) : super(key: key);

  @override
  State<ContactPresident> createState() => _ContactPresidentState();
}

class _ContactPresidentState extends State<ContactPresident> {
  final TextEditingController _civilRegistry = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Appbar(
              title: 'Contact The President',
              onSearch: () {},
              onIconPressed: () {},
              view: false,
            ),
          ),
          InputField(
              controller: _civilRegistry,
              secured: false,
              label: 'Civil Registry',
              prefex: Icon(Icons.numbers)),
          SizedBox(
            height: 10,
          ),
          InputField(
              controller: _nameController,
              secured: false,
              label: 'Name',
              prefex: Icon(Icons.person)),
          SizedBox(
            height: 10,
          ),
          InputField(
              controller: _emailController,
              secured: false,
              label: 'Email',
              prefex: Icon(Icons.email)),
          SizedBox(
            height: 10,
          ),
          InputField(
              controller: _phoneController,
              secured: false,
              label: 'Phone Number',
              prefex: Icon(Icons.phone)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
            child: Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 2.0,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                hint: Text('  Applicant Category',
                    style: TextStyle(fontSize: 18, color: AppTheme.lightText)),
                style: TextStyle(color: AppTheme.lightText, fontSize: 18),
                value: selectedValue,
                items: const [
                  DropdownMenuItem(
                    value: '  Student',
                    child: Text('  Student'),
                  ),
                  DropdownMenuItem(
                    value: '  Employee',
                    child: Text('  Employee'),
                  ),
                  DropdownMenuItem(
                    value: '  Visitor',
                    child: Text('  Visitor'),
                  ),
                  DropdownMenuItem(
                    value: '  Member',
                    child: Text('  Member'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              )),
            ),
          ),
          InputField(
            controller: _messageController,
            secured: false,
            label: 'Communication summary',
            prefex: Icon(Icons.message),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: uploadFile,
              icon: Icon(Icons.attach_file, color: AppTheme.lightText),
              label: Text('Attach File',
                  style: TextStyle(fontSize: 18, color: AppTheme.lightText)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          MyButton(
              callback: () {
                showSnackBar(message: 'Sent Successfully');
              },
              label: 'Send'),
        ],
      ),
    );
  }

  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      showSnackBar(message: 'File Uploaded Successfully');
    }
  }
}

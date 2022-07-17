import 'dart:io';
import 'package:northern_border_university/view/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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
            padding: const EdgeInsets.all(8.0),
            child: InputField(
                controller: _civilRegistry,
                secured: false,
                label: 'Civil Registry',
                prefex: Icon(Icons.numbers)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputField(
                controller: _nameController,
                secured: false,
                label: 'Name',
                prefex: Icon(Icons.person)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputField(
                controller: _emailController,
                secured: false,
                label: 'Email',
                prefex: Icon(Icons.email)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputField(
                controller: _phoneController,
                secured: false,
                label: 'Phone Number',
                prefex: Icon(Icons.phone)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                hint: Text('Applicant Category',
                    style: TextStyle(fontSize: 18, color: Colors.green[800])),
                style: TextStyle(color: Colors.green[800], fontSize: 18),
                value: selectedValue,
                items: const [
                  DropdownMenuItem(
                    value: 'Student',
                    child: Text('Student'),
                  ),
                  DropdownMenuItem(
                    value: 'Employee',
                    child: Text('Employee'),
                  ),
                  DropdownMenuItem(
                    value: 'Visitor',
                    child: Text('Visitor'),
                  ),
                  DropdownMenuItem(
                    value: 'Member',
                    child: Text('Member'),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputField(
              controller: _messageController,
              secured: false,
              label: 'Communication summary',
              prefex: Icon(Icons.message),
              maxLines: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {
                uploadFile();
              },
              icon: Icon(Icons.attach_file, color: Colors.green[800]),
              label: Text('Attach File',
                  style: TextStyle(fontSize: 18, color: Colors.green[800])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green[800],
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.green[800]!,
                  ),
                ),
              ),
              child: Text('Send'),
            ),
          ),
        ],
      ),
    );
  }

  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
    }
  }
}

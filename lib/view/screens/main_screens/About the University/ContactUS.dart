import 'package:northern_border_university/controller/functions.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:northern_border_university/view/widgets/input_field.dart';
import 'package:northern_border_university/view/widgets/list_items.dart';
import 'package:flutter/material.dart';
import 'package:northern_border_university/view/widgets/my_button.dart';

import '../../../../controller/app_theme.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({Key? key}) : super(key: key);

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Appbar(
              title: 'Contact US',
              search: Icons.search,
              onSearch: () {},
            ),
          ),
          ListItems(title: 'Contact Info:', items: const [
            'Email: ',
            'Telephone: 920000540',
            'Fax: 6146620771, Saudi Arabia',
            'PO Box: 1321 postal code: 91431, Arar.',
          ]),
          SizedBox(height: 10),
          InputField(
              controller: _nameController,
              secured: false,
              label: 'Name',
              prefex: Icon(Icons.person)),
          SizedBox(height: 10),
          InputField(
              controller: _emailController,
              secured: false,
              label: 'Email',
              prefex: Icon(Icons.email)),
          SizedBox(height: 10),
          InputField(
              controller: _subjectController,
              secured: false,
              label: 'Subject',
              prefex: Icon(Icons.subject)),
          SizedBox(height: 10),
          InputField(
            controller: _messageController,
            secured: false,
            label: 'Message',
            prefex: Icon(Icons.message),
          ),
          SizedBox(height: 20),
          MyButton(
              callback: () {
                showSnackBar(message: 'Sent Successfully');
              },
              label: 'Send'),
        ],
      ),
    );
  }
}

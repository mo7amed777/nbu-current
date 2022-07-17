import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:northern_border_university/view/widgets/input_field.dart';
import 'package:northern_border_university/view/widgets/list_items.dart';
import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Appbar(
              title: 'Contact US',
              onIconPressed: () {},
              search: false,
              view: false,
              onSearch: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListItems(title: 'Contact Info:', items: const [
              'Email: ',
              'Telephone: 920000540',
              'Fax: 6146620771, Saudi Arabia',
              'PO Box: 1321 postal code: 91431, Arar.',
            ]),
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
                controller: _subjectController,
                secured: false,
                label: 'Subject',
                prefex: Icon(Icons.subject)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputField(
              controller: _messageController,
              secured: false,
              label: 'Message',
              prefex: Icon(Icons.message),
              maxLines: 5,
            ),
          ),
          SizedBox(height: 20),
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
}

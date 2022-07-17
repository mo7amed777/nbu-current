import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title, subtitle;

  const MyListTile({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                  fontSize: 16)),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontWeight: FontWeight.w500, height: 1.5),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../controller/themes/app_theme.dart';

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
                  color: AppTheme.lightText,
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

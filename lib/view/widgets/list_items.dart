import 'package:flutter/material.dart';

import '../../controller/themes/app_theme.dart';

class ListItems extends StatelessWidget {
  final String title, subtitle;
  final List<String> items;
  final IconData icon;

  const ListItems(
      {required this.title,
      required this.items,
      this.icon = Icons.circle,
      this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 2.0,
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.lightText,
                      fontSize: 16)),
              subtitle == ''
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(subtitle, style: TextStyle(height: 1.5)),
                    ),
            ],
          ),
        ),
        subtitle: Column(
          children: items.map(goal).toList(),
        ),
      ),
    );
  }

  Widget goal(String itemText) => Padding(
        padding: const EdgeInsets.only(
          top: 4.0,
          left: 4.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon == Icons.circle
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(
                      icon,
                      size: 10,
                    ),
                  )
                : Icon(icon, size: 18, color: AppTheme.lightText),
            SizedBox(width: 6),
            Flexible(
              child: Text(
                itemText,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      );
}

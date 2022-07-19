import 'package:flutter/material.dart';

import '../../controller/themes/app_theme.dart';

class DownloadCard extends StatelessWidget {
  final String title;
  final Function download;

  const DownloadCard({required this.title, required this.download});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0),
      child: ListTile(
        trailing: IconButton(
          icon: Icon(Icons.file_download, color: AppTheme.lightText),
          onPressed: () => download(),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(title,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.lightText,
                  fontSize: 16)),
        ),
      ),
    );
  }
}

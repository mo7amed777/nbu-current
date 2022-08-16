import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen(
      {required this.article, required this.imgURL, required this.item});
  final Article article;
  final String imgURL;
  final item;
  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Appbar(
              title: widget.article.getItemFields(widget.item)["title"],
              onSearch: (val) {},
              search: Icons.search,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              widget.imgURL,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Published at : ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppTheme.lightText),
                ),
                Text(
                  formatDate(
                      widget.article.getItemFields(widget.item)["created"]),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppTheme.lightText),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.article.getItemFields(widget.item)["body"],
              style: TextStyle(height: 1.5, color: AppTheme.lightText),
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(String date) {
    String newDate = DateTime.parse(date).toLocal().toString();
    return newDate.replaceRange(newDate.length - 5, newDate.length - 1, '');
  }
}

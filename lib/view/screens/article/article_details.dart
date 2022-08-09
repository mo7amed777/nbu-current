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
              onIconPressed: () {},
              onSearch: (val) {},
              search: true,
              view: false,
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
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  formatDate(
                      widget.article.getItemFields(widget.item)["created"]),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.article.getItemFields(widget.item)["body"],
              style: TextStyle(height: 1.5),
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

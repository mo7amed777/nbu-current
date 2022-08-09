import 'package:northern_border_university/model/article.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'article_details.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({required this.items});
  final List items;
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
            child: Appbar(
              title: 'Articles',
              onIconPressed: () {},
              search: true,
              view: false,
              onSearch: (val) {},
            ),
          ),
          Expanded(
            child: ListView(
                children: widget.items.map((item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text(item['attributes']['title']),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(item['attributes']['body']['summary'],
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                      onTap: () async {
                        Article article = Article();
                        String imgURL = await article.getItemImageURL(item);
                        Get.to(ArticleDetailScreen(
                          article: article,
                          imgURL: imgURL,
                          item: item,
                        ));
                      },
                    ),
                  ),
                ),
              );
            }).toList()),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

const String DOMAIN = 'https://mobile-app-apis.nbu.edu.sa/';

class Article {
  List<dynamic> items = [];

  Future<void> getAllItems() async {
    final http.Response response = await http.get(
        Uri.parse("https://mobile-app-apis.nbu.edu.sa/jsonapi/node/article"));
    print(response.body);
    final body = jsonDecode(response.body);
    items = body["data"];
    print(items);
  }

  dynamic getItemFields(dynamic item) => {
        "id": item["id"],
        "type": item["type"],
        "title": item["attributes"]["title"],
        "created": item["attributes"]["created"],
        "changed": item["attributes"]["changed"],
        "body": item["attributes"]["body"]["value"],
        "comment": {
          "status": item["attributes"]["comment"]["status"],
          "cid": item["attributes"]["comment"]["cid"],
          "last_comment_timestamp": item["attributes"]["comment"]
              ["last_comment_timestamp"],
          "last_comment_name": item["attributes"]["comment"]
              ["last_comment_name"],
          "last_comment_uid": item["attributes"]["comment"]["last_comment_uid"],
          "comment_count": item["attributes"]["comment"]["comment_count"]
        },
      };

  Future<String> getItemImageURL(dynamic item) async {
    String url =
        item["relationships"]["field_image"]["links"]["related"]["href"];
    final http.Response response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    String imgURL = DOMAIN + body["data"]["attributes"]["uri"]["url"];
    print(imgURL);
    return imgURL;
  }
}

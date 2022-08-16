import 'package:flutter/material.dart';
import 'package:northern_border_university/controller/app_theme.dart';

class MediaCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Function onTap;

  const MediaCard(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(title,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppTheme.lightGreen)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: AppTheme.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: AppTheme.green),
            ],
          ),
        ),
      ),
    );
  }
}

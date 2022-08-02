import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/News/details.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:northern_border_university/view/widgets/media_card.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Appbar(
              title: 'News',
              onIconPressed: () {},
              search: true,
              searchController: searchController,
              view: false,
              onSearch: () {},
            ),
          ),
          MediaCard(
            title:
                'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
            subtitle: '26 Sha’ban 1443 Hijri',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              Get.to(NewsDetail(
                title:
                    'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
                date: '26 Sha’ban 1443 Hijri',
                image: 'assets/images/media/placeholder.jpg',
              ));
            },
          ),
          MediaCard(
            title:
                'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
            subtitle: '26 Sha’ban 1443 Hijri',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              Get.to(NewsDetail(
                title:
                    'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
                date: '26 Sha’ban 1443 Hijri',
                image: 'assets/images/media/placeholder.jpg',
              ));
            },
          ),
          MediaCard(
            title:
                'Information Technology Deanship obtained the ISO 9001-2015 certificate',
            subtitle: '26 Sha’ban 1443 Hijri',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              Get.to(NewsDetail(
                title:
                    'Information Technology Deanship obtained the ISO 9001-2015 certificate',
                date: '26 Sha’ban 1443 Hijri',
                image: 'assets/images/media/placeholder.jpg',
              ));
            },
          ),
          MediaCard(
            title:
                'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
            subtitle: '26 Sha’ban 1443 Hijri',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              Get.to(NewsDetail(
                title:
                    'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
                date: '26 Sha’ban 1443 Hijri',
                image: 'assets/images/media/placeholder.jpg',
              ));
            },
          ),
          MediaCard(
            title:
                'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
            subtitle: '26 Sha’ban 1443 Hijri',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              Get.to(NewsDetail(
                title:
                    'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
                date: '26 Sha’ban 1443 Hijri',
                image: 'assets/images/media/placeholder.jpg',
              ));
            },
          ),
          MediaCard(
            title:
                'Information Technology Deanship obtained the ISO 9001-2015 certificate',
            subtitle: '26 Sha’ban 1443 Hijri',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              Get.to(NewsDetail(
                title:
                    'Information Technology Deanship obtained the ISO 9001-2015 certificate',
                date: '26 Sha’ban 1443 Hijri',
                image: 'assets/images/media/placeholder.jpg',
              ));
            },
          ),
          MediaCard(
            title:
                'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
            subtitle: '26 Sha’ban 1443 Hijri',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              Get.to(NewsDetail(
                title:
                    'برعاية رئيس الجامعة نعلن أنطلاق البطولات الرياضية ضمن فعاليات المهرجان الرمضاني العاشر',
                date: '26 Sha’ban 1443 Hijri',
                image: 'assets/images/media/placeholder.jpg',
              ));
            },
          ),
        ],
      ),
    );
  }
}

import 'package:northern_border_university/view/widgets/download_card.dart';
import 'package:flutter/material.dart';

class Guides extends StatefulWidget {
  const Guides({Key? key}) : super(key: key);

  @override
  State<Guides> createState() => _GuidesState();
}

class _GuidesState extends State<Guides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          DownloadCard(
              title: 'الكتيب التعريفي لجامعة الحدود الشمالية', download: () {}),
          DownloadCard(
              title: 'دليل حوكمة حسابات التواصل الاجتماعي', download: () {}),
          DownloadCard(
              title: 'الدليل التنظيمي لجامعة الحدود الشمالية', download: () {}),
          DownloadCard(
              title: 'القواعد المنظمة للتعليم الالكتروني', download: () {}),
          DownloadCard(title: 'خطة ادارة المخاطر', download: () {}),
          DownloadCard(title: 'دليل الخدمات الالكترونية ', download: () {}),
          DownloadCard(title: 'دليل الخدمات الصحية ', download: () {}),
          DownloadCard(title: 'دليل السبورة الذكية ', download: () {}),
          DownloadCard(
              title: 'دليل المستخدم لنظام الدعم الفني ', download: () {}),
          DownloadCard(
              title: 'دليل مؤشرات الأداء الرئيسية والمقارنات المرجعية ',
              download: () {}),
          DownloadCard(title: 'دليل نظام الجودة', download: () {}),
          DownloadCard(
              title: 'دليل تفعيل خدمات ذوي الاحتياجات الخاصة Blackbord Ally ',
              download: () {}),
          DownloadCard(
              title: 'الدليل التنظيمي للأقسام العلمية ', download: () {}),
          DownloadCard(
              title:
                  'دليل المستخدم لكشف صحة محتوى الواجبات والبحوث المقدمة من الطلاب (SafeAssign)',
              download: () {}),
          DownloadCard(title: 'دليل وحدة المكتبة الرقمية ', download: () {}),
          DownloadCard(title: 'دليل سياسة خدمة الإعارة ', download: () {}),
          DownloadCard(title: 'دليل الهوية البصرية', download: () {}),
          DownloadCard(title: 'دليل مركز رواد الشمال ', download: () {}),
          DownloadCard(title: 'دليل إجراءات التزويد', download: () {}),
          DownloadCard(title: 'الاهداء والتبادل ', download: () {}),
          DownloadCard(
              title: 'User Guide to Blackboard for Faculty', download: () {}),
        ],
      ),
    );
  }
}

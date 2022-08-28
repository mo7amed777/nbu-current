import 'package:flutter/material.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';

import '../../../../controller/app_theme.dart';

class FactsandFigures extends StatefulWidget {
  const FactsandFigures({Key? key}) : super(key: key);

  @override
  State<FactsandFigures> createState() => _FactsandFiguresState();
}

class _FactsandFiguresState extends State<FactsandFigures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
            child: Appbar(
              title: 'Facts and Figures',
              search: Icons.search,
              onSearch: () {},
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                card(title: 'Students', number: 16154),
                card(title: 'Colleges', number: 16154),
                card(title: 'Alumni', number: 16154),
                card(title: 'External Scholarships', number: 16154),
                card(title: 'Staff Members', number: 16154),
                card(title: 'Faculty Members', number: 16154),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget card({required String title, required int number}) => Card(
        margin: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(number.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.lightText,
                      fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.lightText,
                      fontSize: 18)),
            ),
          ],
        ),
      );
}

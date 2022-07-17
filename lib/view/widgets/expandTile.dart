import 'package:flutter/material.dart';

class ExpandedTile extends StatelessWidget {
  final String mainTitle;
  final String? title;
  final List<String>? TwoItemsRow;
  final Function onTap;

  const ExpandedTile({
    required this.mainTitle,
    this.title,
    this.TwoItemsRow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: Text(mainTitle), children: [
      ListTile(
        onTap: () => onTap(),
        title: Text(title ?? ''),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(TwoItemsRow?.first ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(TwoItemsRow?.last ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ]);
  }
}

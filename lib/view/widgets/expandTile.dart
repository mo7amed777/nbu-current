import 'package:flutter/material.dart';

class ExpandedTile extends StatefulWidget {
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
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(expanded ? 0 : 30)),
      child: ExpansionTile(
          title: Text(widget.mainTitle),
          onExpansionChanged: ((value) {
            setState(() {
              expanded = value;
            });
          }),
          children: [
            ListTile(
              onTap: () => widget.onTap(),
              title: Text(widget.title ?? ''),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.TwoItemsRow?.first ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.TwoItemsRow?.last ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

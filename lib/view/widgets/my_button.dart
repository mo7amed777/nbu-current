import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function callback;
  final String label;

  const MyButton({required this.callback, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => callback(),
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          alignment: Alignment.center,
          animationDuration: Duration(milliseconds: 700),
          backgroundColor: Colors.green[800],
          elevation: 10,
          primary: Colors.white,
          textStyle: TextStyle(
            fontSize: 25,
            overflow: TextOverflow.fade,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
      child: Text(label),
    );
  }
}

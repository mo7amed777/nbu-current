import 'package:flutter/material.dart';
import 'package:northern_border_university/controller/app_theme.dart';

class MyButton extends StatelessWidget {
  final Function callback;
  final String label;

  const MyButton({required this.callback, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              gradient: LinearGradient(colors: const [
                AppTheme.green,
                AppTheme.green,
              ])),
          child: FlatButton(
            child: Text(
              label,
              style: TextStyle(
                  color: AppTheme.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            onPressed: () => callback(),
          ),
        ));
  }
}

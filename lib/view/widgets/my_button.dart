import 'package:flutter/material.dart';

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
                Color.fromARGB(193, 197, 154, 89),
                Color(0xffff3a5a),
              ])),
          child: FlatButton(
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            onPressed: () => callback(),
          ),
        ));
  }
}

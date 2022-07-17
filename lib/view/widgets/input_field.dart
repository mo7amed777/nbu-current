import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool secured;
  final String label;
  final Widget? prefex, suffix;
  final int maxLines;

  const InputField({
    required this.controller,
    required this.secured,
    required this.label,
    this.prefex,
    this.suffix,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secured,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.green[800]!,
            )),
        label: Text(
          label,
          style: TextStyle(color: Colors.green[800], fontSize: 18),
        ),
        prefixIcon: prefex ?? Container(),
        suffixIcon: suffix ??
            SizedBox(
              height: 1,
              width: 1,
            ),
      ),
    );
  }
}

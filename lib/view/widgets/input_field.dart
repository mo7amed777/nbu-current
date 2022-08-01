import 'package:flutter/material.dart';

import '../../controller/themes/app_theme.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool secured;
  final String label;
  final Widget? prefex, suffix;

  const InputField({
    required this.controller,
    required this.secured,
    required this.label,
    this.prefex,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: TextFormField(
          obscureText: secured,
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
            hintText: label,
            prefixIcon: prefex ??
                Material(
                  elevation: 0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: prefex,
                ),
            suffixIcon: suffix ??
                Material(
                  elevation: 0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: suffix,
                ),
          ),
        ),
      ),
    );
  }
}

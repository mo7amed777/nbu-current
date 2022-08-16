import 'package:flutter/material.dart';
import 'package:northern_border_university/controller/app_theme.dart';

class RadioButton extends StatelessWidget {
  final String label, firstOption, lastOption;
  final Function onFirstChanged, onLastChanged;
  final bool firstValue, lastValue, firstGroupValue, lastGroupValue;
  const RadioButton({
    required this.label,
    required this.firstOption,
    required this.lastOption,
    required this.firstValue,
    required this.lastValue,
    required this.firstGroupValue,
    required this.lastGroupValue,
    required this.onFirstChanged,
    required this.onLastChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.lightText,
              ),
            ),
          ),
          Row(
            children: [
              Radio(
                value: firstValue,
                groupValue: firstGroupValue,
                onChanged: (_) => onFirstChanged(),
              ),
              Text(
                firstOption,
                style: TextStyle(
                  color: AppTheme.lightText,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: lastValue,
                groupValue: lastGroupValue,
                onChanged: (_) => onLastChanged(),
              ),
              Text(
                lastOption,
                style: TextStyle(
                  color: AppTheme.lightText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

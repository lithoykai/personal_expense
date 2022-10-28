import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
//  const AdaptativeTextField({Key? key}) : super(key: key);
  final String? label;
  TextEditingController controller;
  final void Function(String) onSubmitted;
  bool? isNumber;

  AdaptativeTextField({
    this.label,
    required this.controller,
    required this.onSubmitted,
    this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              onSubmitted: onSubmitted,
              controller: controller,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              placeholder: label,
              keyboardType: isNumber == true
                  ? TextInputType.numberWithOptions(decimal: isNumber)
                  : null,
            ),
          )
        : TextField(
            onSubmitted: onSubmitted,
            controller: controller,
            decoration: InputDecoration(label: Text(label!)),
            keyboardType: isNumber == true
                ? TextInputType.numberWithOptions(decimal: isNumber)
                : null);
  }
}

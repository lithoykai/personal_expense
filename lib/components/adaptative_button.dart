import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  AdaptativeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
          )
        : ElevatedButton(onPressed: onPressed, child: Text(label));
  }
}

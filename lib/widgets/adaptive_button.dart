import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  AdaptiveButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text('Add Transaction'), onPressed: () => onPressed)
        : RaisedButton(
            child: Text('Add Transaction'),
            color: Theme.of(context).primaryColor,
            onPressed: () => onPressed);
  }
}

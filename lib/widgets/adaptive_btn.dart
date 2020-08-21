import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveBTN extends StatelessWidget {
  final String text;
  final Function submitHandler;
  AdaptiveBTN({
    this.submitHandler,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Colors.green,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: submitHandler,
          )
        : RaisedButton(
            textColor: Colors.white,
            color: Colors.green,
            onPressed: submitHandler,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
  }
}

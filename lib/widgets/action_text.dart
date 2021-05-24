import 'package:flutter/material.dart';

class ActionText extends StatelessWidget {
  final Function onTap;
  final String text;
  ActionText({
    this.onTap,
    this.text,
  });

  Widget build(context) {
    return InkWell(
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'futur',
          fontSize: 14,
          color: Theme.of(context).accentColor,
        ),
        textDirection: TextDirection.ltr,
      ),
      onTap: onTap,
    );
  }
}

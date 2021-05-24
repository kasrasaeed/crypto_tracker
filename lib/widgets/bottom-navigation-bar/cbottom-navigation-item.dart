import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CBottomNavigationItem extends StatelessWidget {
  final Function onTap;
  final Text title;
  final FaIcon icon;

  CBottomNavigationItem({
    @required this.onTap,
    @required this.icon,
    @required this.title,
  });

  Widget build(context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          width: 381,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: icon),
              Expanded(child: title),
            ],
          ),
        ),
      ),
    );
  }
}

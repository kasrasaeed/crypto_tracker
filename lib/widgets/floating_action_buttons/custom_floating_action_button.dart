import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Color color;
  final Function onTap;
  final Widget child;

  CustomFloatingActionButton({
    this.color,
    this.child,
    this.onTap,
  });

  Widget build(context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: child,
      ),
    );
  }
}

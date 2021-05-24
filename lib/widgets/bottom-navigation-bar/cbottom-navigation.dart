import 'package:flutter/material.dart';
import 'dart:ui';

class CBottomNavigationBar extends StatelessWidget {
  final double width;
  final double height;
  final List<Widget> items;

  CBottomNavigationBar({
    @required this.width,
    @required this.height,
    @required this.items,
  });
  Widget build(context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Theme.of(context).backgroundColor,
        ),
        width: width,
        height: height,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Padding(
                  padding: EdgeInsets.only(top: constraints.maxHeight * 0.15),
                  child: Row(
                    children: [...items],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

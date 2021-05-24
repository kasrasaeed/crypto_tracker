import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OutLinedFloatingActionButton extends StatelessWidget {
  final Color color;
  final Function onTap;
  final Icon child;
  final bool errorEnabled;
  OutLinedFloatingActionButton({
    this.color,
    this.onTap,
    this.child,
    this.errorEnabled,
  });
  Widget build(context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: errorEnabled ? HexColor('#BB2222') : color,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

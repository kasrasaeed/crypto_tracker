import 'package:crypto_tracker/widgets/floating_action_buttons/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import '../widgets/floating_action_buttons/outlined_floating_action_button.dart';

class FloatingActionBar extends StatelessWidget {
  final double width;
  final double height;

  final Widget actionBarText2;

  final OutLinedFloatingActionButton outLinedFloatingActionButton;
  final CustomFloatingActionButton customFloatingActionButton;
  FloatingActionBar({
    @required this.width,
    @required this.height,
    @required this.actionBarText2,
    this.customFloatingActionButton,
    this.outLinedFloatingActionButton,
  });

  Widget build(context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 1,
              ),
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  actionBarText2,
                ],
              ),
            ),
            customFloatingActionButton == null
                ? outLinedFloatingActionButton
                : customFloatingActionButton,
          ],
        ),
      ),
    );
  }
}

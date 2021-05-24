import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ErrorText extends StatelessWidget {
  final String _errorText;

  ErrorText(this._errorText);

  Widget build(context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        left: 33,
      ),
      child: Text(
        _errorText,
        style: TextStyle(
          color: HexColor('#BB2222'),
          fontSize: 16,
        ),
      ),
    );
  }
}

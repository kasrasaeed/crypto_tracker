import 'package:crypto_tracker/models/crypto_model/crypto_model.dart';
import 'package:crypto_tracker/screens/home_route/widgets/news_segment.dart';
import 'package:crypto_tracker/screens/home_route/widgets/overview_segment.dart';
import 'package:flutter/material.dart';
import './widgets/price_header.dart';

class ProfileScreen extends StatelessWidget {
  static final routeName = '/profile_screen';
  Widget build(context) {
    final double _width = MediaQuery.of(context).size.width;
    //final double _height = MediaQuery.of(context).size.height;
    final List<CryptoModel> args =
        ModalRoute.of(context).settings.arguments as List;
    final CryptoModel _crypto = args[0];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          _crypto.name,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            PriceHeader(_width, _crypto),
            OverviewSegment(_crypto),
            NewsSegment(crypto: _crypto),
          ],
        ),
      ),
    );
  }
}

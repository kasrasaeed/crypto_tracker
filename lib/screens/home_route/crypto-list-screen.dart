import 'package:crypto_tracker/porvider/crypto_provider.dart';
import 'package:crypto_tracker/porvider/filter.dart';
import 'package:crypto_tracker/widgets/search-bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/crypto-list/crypto-list.dart';

class CryptoListScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Filter(),
        ),
        ChangeNotifierProvider.value(
          value: CryptoProvider(),
        ),
      ],
      child: Stack(
        children: [
          SearchBar(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 13,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.65,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: CryptoList(),
            ),
          ),
        ],
      ),
    );
  }
}

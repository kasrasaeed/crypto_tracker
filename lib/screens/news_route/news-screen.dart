import 'package:crypto_tracker/widgets/crypto_news/news_list.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'اخبار',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: NewsList(),
      ),
    );
  }
}

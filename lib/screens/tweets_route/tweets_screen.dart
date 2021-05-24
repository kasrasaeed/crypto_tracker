import 'package:crypto_tracker/widgets/crypto_tweets/tweets_list.dart';
import 'package:flutter/material.dart';

class TweetsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'توییت ها',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: TweetsList(),
      ),
    );
  }
}

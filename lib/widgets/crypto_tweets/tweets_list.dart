import 'package:crypto_tracker/widgets/crypto_tweets/tweets_list_tile.dart';
import 'package:flutter/material.dart';
import '../../models/application.dart';

class TweetsList extends StatefulWidget {
  _TweetsListState createState() => _TweetsListState();
}

class _TweetsListState extends State<TweetsList> {
  List _tweetsList;

  @override
  void initState() {
    super.initState();
    _tweetsList = Application.cryptoTweetsList;
  }

  Widget build(BuildContext context) {
    _tweetsList = Application.cryptoTweetsList;

    return Container(
        child: _tweetsList != null
            ? ListView.builder(
                itemCount: _tweetsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: index != 0 ? 7 : 0,
                    ),
                    child:
                        TweetsListTile(cryptoTweetsModel: _tweetsList[index]),
                  );
                })
            : Center(
                child: Text('list is empty'),
              ));
  }
}

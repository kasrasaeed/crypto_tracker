import 'package:crypto_tracker/models/tweets_model/tweet_model.dart';
import 'package:flutter/material.dart';

class TweetsListTile extends StatelessWidget {
  final TweetModel cryptoTweetsModel;

  TweetsListTile({
    @required this.cryptoTweetsModel,
  });

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        child: ListTile(
          leading: Column(
            children: [
              Expanded(
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(cryptoTweetsModel.cryptoId)),
              ),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              cryptoTweetsModel.tweetAuthur,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              cryptoTweetsModel.tweetContent,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}

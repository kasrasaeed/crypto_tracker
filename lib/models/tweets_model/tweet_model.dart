import 'package:crypto_tracker/models/tweets_model/tweet.dart';

class TweetModel extends Tweet {
  TweetModel.fromJson(Map<String, dynamic> tweetJson) {
    cryptoId = tweetJson['crypto_id'];
    tweetAuthur = tweetJson['tweets']['tweet_authur'];
    tweetContent = tweetJson['tweets']['tweet_content'];
  }
}

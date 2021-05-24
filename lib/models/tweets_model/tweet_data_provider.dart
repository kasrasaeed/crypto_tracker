import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TweetDataProvider {
  static Future<List<dynamic>> getCryptoTweetsList() async {
    final _uri = Uri.parse('http://149.202.16.106:5000/tweets');
    final _response = await http.Client().get(_uri);
    final List<dynamic> _responseList =
        convert.jsonDecode(_response.body)['crypto_tweets'];
    return _responseList;
  }
}

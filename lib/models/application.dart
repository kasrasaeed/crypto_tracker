import 'package:crypto_tracker/models/crypto_model/crypto_data_provider.dart';
import 'package:crypto_tracker/models/crypto_model/crypto_model.dart';
import 'package:crypto_tracker/models/crypto_news_model/crypto_news_data_provider.dart';
import 'package:crypto_tracker/models/crypto_news_model/crypto_news_model.dart';
import 'package:crypto_tracker/models/tweets_model/tweet_data_provider.dart';
import 'package:crypto_tracker/models/tweets_model/tweet_model.dart';
import 'package:crypto_tracker/models/user_model/user_data_provider.dart';
import 'package:device_info/device_info.dart';

abstract class Application {
  static List<CryptoModel> cryptoList;
  static List<CryptoNewsModel> cryptoNewsList;
  static List<TweetModel> cryptoTweetsList;
  static dynamic userObject;
  static bool hasLogedIn = false;
  static String deviceIdentifier;
  static List<Map<String, dynamic>> targetPriceList = [
    {
      'coinName': 'eth',
      'targetPrice': 2400.5,
    }
  ];

  static void convertFutureToListOfCryptoModel() async {
    List<dynamic> cryptoJson = await CryptoDataProvider.getCryptoList();

    cryptoList = cryptoJson.map((cryptoMap) {
      return CryptoModel.fromJson(cryptoMap);
    }).toList();
  }

  static void convertFutureToListOfCryptoNewsModel() async {
    List<dynamic> cryptoJson = await CryptoNewsDataProvider.getCryptoNewsList();

    cryptoNewsList = cryptoJson.map((cryptoMap) {
      return CryptoNewsModel.fromJson(cryptoMap);
    }).toList();
  }

  static void convertFutureToListOfCryptoTweetsModel() async {
    List<dynamic> tweetsJson = await TweetDataProvider.getCryptoTweetsList();

    cryptoTweetsList = tweetsJson.map((cryptoMap) {
      return TweetModel.fromJson(cryptoMap);
    }).toList();
  }

  static void convertFutureToUserModelObject() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

    var build = await deviceInfoPlugin.androidInfo;

    String identifier = build.androidId;
    userObject = await UserDataProvider.getUser(identifier);
    deviceIdentifier = build.androidId;
    userObject = await UserDataProvider.getUser(deviceIdentifier);

    print(userObject);
    if (userObject['result'] == -1) {
      hasLogedIn = false;
    } else {
      hasLogedIn = true;
    }
  }

  static void getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

    var build = await deviceInfoPlugin.androidInfo;

    deviceIdentifier = build.androidId;
    print(deviceIdentifier);
  }

  static void httpPostUser(String uuid, String phoneNumber) async {
    userObject = await UserDataProvider.sendUser(uuid, phoneNumber);
    print(userObject.body);
  }
}

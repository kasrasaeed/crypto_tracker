import 'package:crypto_tracker/models/crypto_news_model/crypto_news.dart';

class CryptoNewsModel extends CryptoNews {
  CryptoNewsModel.fromJson(Map<String, dynamic> json) {
    cryptoId = json['crypto_id'];
    cryptoNewsTitle = json['news']['news_title'];
    cryptoNewsDescription = json['news']['news_description'];
    cryptoNewsLink = json['news']['news_link'];
    cryptoNewsImage = json['news']['news_image'];
  }
}

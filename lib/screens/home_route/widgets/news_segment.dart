import 'package:crypto_tracker/models/application.dart';
import 'package:crypto_tracker/models/crypto_model/crypto_model.dart';
import 'package:crypto_tracker/widgets/crypto_news/news_list_tile.dart';
import 'package:flutter/material.dart';

class NewsSegment extends StatelessWidget {
  final _newsList = Application.cryptoNewsList;
  final CryptoModel crypto;
  NewsSegment({this.crypto});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'اخبار',
            style: Theme.of(context).textTheme.headline3,
          ),
          ..._newsList
              .where((newsModel) {
                return newsModel.cryptoId == crypto.id;
              })
              .toList()
              .map((models) {
                return NewsListTile(cryptoNewsModel: models);
              })
              .toList(),
        ],
      ),
    );
  }
}

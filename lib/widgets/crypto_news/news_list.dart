import 'package:crypto_tracker/widgets/crypto_news/news_list_tile.dart';
import 'package:flutter/material.dart';
import '../../models/application.dart';

class NewsList extends StatefulWidget {
  _CryptoListState createState() => _CryptoListState();
}

class _CryptoListState extends State<NewsList> {
  List _newsList;

  @override
  void initState() {
    super.initState();
    _newsList = Application.cryptoNewsList;
  }

  Widget build(BuildContext context) {
    _newsList = Application.cryptoNewsList;

    return Container(
        child: _newsList != null
            ? ListView.builder(
                itemCount: _newsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: index != 0 ? 7 : 0,
                    ),
                    child: NewsListTile(cryptoNewsModel: _newsList[index]),
                  );
                })
            : Center(
                child: Text('list is empty'),
              ));
  }
}

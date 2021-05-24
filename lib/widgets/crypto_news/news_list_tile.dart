import 'package:crypto_tracker/models/crypto_news_model/crypto_news_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class NewsListTile extends StatelessWidget {
  final CryptoNewsModel cryptoNewsModel;

  NewsListTile({
    @required this.cryptoNewsModel,
  });

  _launchURL() async {
    final url = cryptoNewsModel.cryptoNewsLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        child: ListTile(
          leading: Column(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.05,
                backgroundColor: Theme.of(context).backgroundColor,
                backgroundImage: NetworkImage(
                  cryptoNewsModel.cryptoNewsImage.split(',')[0],
                  scale: 1,
                ),
              ),
              Expanded(
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(cryptoNewsModel.cryptoId)),
              ),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              cryptoNewsModel.cryptoNewsTitle,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              cryptoNewsModel.cryptoNewsDescription,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}

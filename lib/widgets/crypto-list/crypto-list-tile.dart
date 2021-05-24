import 'package:crypto_tracker/models/crypto_model/crypto_model.dart';
import 'package:crypto_tracker/screens/home_route/profile_screen.dart';
import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  final CryptoModel cryptoModel;

  CryptoListTile({
    @required this.cryptoModel,
  });

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProfileScreen.routeName, arguments: [cryptoModel]);
      },
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.05,
            backgroundColor: Theme.of(context).backgroundColor,
            child: cryptoModel.image == "not found"
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("crypto image"),
                  )
                : Image.network(
                    cryptoModel.image,
                    scale: 0.5,
                  ),
          ),
          title: Text(
            cryptoModel.name,
            style: Theme.of(context).textTheme.headline3,
          ),
          subtitle: Text(
            cryptoModel.symbol,
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '\$${cryptoModel.price}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Text(
                      cryptoModel.twentyFourHourChangePercentage
                              .toString()
                              .substring(0, 4) +
                          '%',
                      style: TextStyle(
                        fontSize: 18,
                        color: cryptoModel.twentyFourHourChangePercentage < 0
                            ? Color(0xffEB5757)
                            : Color(0xff27AE60),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

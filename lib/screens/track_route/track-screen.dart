import 'package:crypto_tracker/models/application.dart';
import 'package:crypto_tracker/screens/login_route/login_screen.dart';
import 'package:crypto_tracker/screens/track_route/widgets/target_list_tile.dart';
import 'package:flutter/material.dart';

class TrackScreen extends StatelessWidget {
  final bool _isTargetPriceListEmpty = Application.targetPriceList.isEmpty;
  final _coinTergetList = Application.targetPriceList;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'ترکر',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Application.hasLogedIn
          ? Center(
              child: _isTargetPriceListEmpty
                  ? Column(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'اضافه کردن کوین جدید',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        ..._coinTergetList.map((mapOfTargetedCoin) {
                          return TargetListTile(
                            coinName: mapOfTargetedCoin['coinName'],
                            targetPrice: mapOfTargetedCoin['targetPrice'],
                          );
                        }).toList(),
                      ],
                    ),
            )
          : Center(
              child: Column(
                children: [
                  Text('دسترسی برای اعضا'),
                  InkWell(
                    child: Text(
                      'عضو شوید',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

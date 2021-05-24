import 'package:flutter/material.dart';

class TargetListTile extends StatelessWidget {
  final String coinName;
  final double targetPrice;

  TargetListTile({this.coinName, this.targetPrice});
  Widget build(context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  children: [
                    Center(
                      child: Text('تغییر دادن',
                          style: Theme.of(context).textTheme.headline3),
                    )
                  ],
                ),
              );
            });
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Theme.of(context).backgroundColor,
          width: MediaQuery.of(context).size.width * 0.88,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coinName,
                style: Theme.of(context).textTheme.headline3,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'هر دفعه ',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'تارگت:  ' + targetPrice.toString(),
                      style: Theme.of(context).textTheme.headline5,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:crypto_tracker/models/crypto_model/crypto_model.dart';
import 'package:flutter/material.dart';

class OverviewSegment extends StatelessWidget {
  final CryptoModel _crypto;

  OverviewSegment(this._crypto);
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 2,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'شاخص ها',
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ': حجم',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${_crypto.volume} \$',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    ': رتبه',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${_crypto.ranking}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ': مارکت کپ',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${_crypto.marketCap} \$',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      ': حجم درگردش',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${_crypto.circulationSupply} \$',
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 2,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

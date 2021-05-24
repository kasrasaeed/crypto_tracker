import 'package:crypto_tracker/models/crypto_model/crypto_model.dart';
import 'package:flutter/material.dart';

class PriceHeader extends StatelessWidget {
  final double width;
  final CryptoModel crypto;

  PriceHeader(this.width, this.crypto);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xffFEFDFE).withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${crypto.price} \$',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            '${crypto.twentyFourHourChangePercentage.toString().substring(0, 4)}%',
            style: TextStyle(
              fontSize: 18,
              color: crypto.twentyFourHourChangePercentage < 0
                  ? Color(0xffEB5757)
                  : Color(0xff27AE60),
            ),
          ),
        ],
      ),
    );
  }
}

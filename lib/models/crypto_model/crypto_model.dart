import 'crypto.dart';

class CryptoModel extends Crypto {
  CryptoModel.fromJson(Map<String, dynamic> cryptoList) {
    id = cryptoList['id'];
    name = cryptoList['name'];
    symbol = cryptoList['symbol'];
    image = cryptoList['image'];
    price = double.parse(cryptoList['current_price'].toString());
    twentyFourHourChangePercentage = cryptoList['price_change_percentage_24h'];
    ranking = cryptoList['market_cap_rank'].toString();
    volume = cryptoList['total_volume'].toString();
    marketCap = cryptoList['market_cap'].toString();
    circulationSupply = cryptoList['circulating_supply'].toString();
  }
}

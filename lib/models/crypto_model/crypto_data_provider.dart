import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CryptoDataProvider {
  static Future<List<dynamic>> getCryptoList() async {
    final _uri = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
    final _response = await http.Client().get(_uri);
    final List<dynamic> _responseList = convert.jsonDecode(_response.body);
    return _responseList;
  }
}

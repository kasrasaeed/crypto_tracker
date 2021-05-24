import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserDataProvider {
  static Future<Map<String, dynamic>> getUser(String uuid) async {
    final _uriRaw = await 'http://149.202.16.106:2323/user/$uuid';
    print(_uriRaw);
    final _uri = Uri.parse(_uriRaw);
    final _response = await http.Client().get(_uri);
    final Map<String, dynamic> _responseMap =
        convert.jsonDecode(_response.body);
    return _responseMap;
  }

  static Future<http.Response> sendUser(String uuid, String phoneNumber) async {
    http.Response response = await http.post(
      Uri.parse('http://149.202.16.106:2323/userId'),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      encoding: convert.Encoding.getByName('utf-8'),
      body: {'uuid': uuid, 'phoneNumber': phoneNumber},
    );
    return response;
  }
}

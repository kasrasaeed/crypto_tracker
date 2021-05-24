import 'package:crypto_tracker/models/crypto_model/crypto_model.dart';
import 'package:flutter/material.dart';

class CryptoProvider extends ChangeNotifier {
  CryptoModel _cryptoModel;
  List<CryptoModel> _cryptoModelList;

  CryptoModel get getCryptoModel {
    return _cryptoModel;
  }

  List<CryptoModel> get getCryptoModelList {
    return _cryptoModelList;
  }

  void cryptoModelNotify(CryptoModel cryptoModel) {
    _cryptoModel = cryptoModel;
    notifyListeners();
  }

  void cryptoModelListNotify(List<CryptoModel> cryptoModelList) {
    _cryptoModelList = cryptoModelList;
    notifyListeners();
  }
}

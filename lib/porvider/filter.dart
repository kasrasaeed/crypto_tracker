import 'package:flutter/material.dart';

class Filter extends ChangeNotifier {
  String _filterText;
  bool _isFilteringActivated;

  String get getFilterText {
    return _filterText;
  }

  bool get getIsFilteringActivated {
    return _isFilteringActivated;
  }

  void filterNotify(String filterText, bool isFilteringActivated) {
    this._filterText = filterText;
    this._isFilteringActivated = isFilteringActivated;
    notifyListeners();
  }
}

import 'package:crypto_tracker/porvider/filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'crypto-list-tile.dart';
import '../../models/application.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CryptoList extends StatefulWidget {
  // final bool hasFilter;
  // final String filterText;
  // final List cryptoList;
  // CryptoList.filter({this.hasFilter, this.filterText, this.cryptoList});
  // CryptoList.getList(
  //     {this.hasFilter = false, this.filterText = '', this.cryptoList});

  _CryptoListState createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  List _cryptoList;
  //var _canBeRendered = false;
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _cryptoList = Application.cryptoList;
  }

  Widget build(BuildContext context) {
    _cryptoList = Application.cryptoList;

    if (Provider.of<Filter>(context).getIsFilteringActivated != null &&
        Provider.of<Filter>(context).getIsFilteringActivated &&
        Provider.of<Filter>(context).getFilterText != null) {
      _cryptoList = _cryptoList.where((element) {
        return element.name
            .toLowerCase()
            .contains(Provider.of<Filter>(context).getFilterText.toLowerCase());
      }).toList();
    }

    return Container(
      child: _cryptoList != null
          ? ListView.builder(
              itemCount: _cryptoList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: index != 0 ? 7 : 0,
                  ),
                  child: CryptoListTile(cryptoModel: _cryptoList[index]),
                );
              })
          : Center(
              child: Text('list is empty'),
            ),
    );
  }
}

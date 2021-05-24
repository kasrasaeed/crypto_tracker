import 'package:crypto_tracker/screens/tweets_route/tweets_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'screens/home_route/crypto-list-screen.dart';
import '../widgets/bottom-navigation-bar/cbottom-navigation-item.dart';
import 'widgets/bottom-navigation-bar/cbottom-navigation.dart';

import 'screens/news_route/news-screen.dart';
import 'screens/track_route/track-screen.dart';

class App extends StatefulWidget {
  static final String routeName = '/app_route';
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int _selectedTab = 1;
  List _screens = [
    TrackScreen(),
    CryptoListScreen(),
    NewsScreen(),
    TweetsScreen(),
  ];

  Widget build(context) {
    TextStyle _unSelectedTabStyle = Theme.of(context).textTheme.subtitle2;
    TextStyle _selectedTabTextStyle = TextStyle(
      fontSize: 14,
      color: Color(0xffFEFDFE),
    );
    //+++++++++++Sizing+++++++++++++
    MediaQueryData _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      bottomNavigationBar: CBottomNavigationBar(
        width: _mediaQuery.size.width,
        height: _mediaQuery.size.height * 0.13,
        items: [
          CBottomNavigationItem(
            onTap: () {
              setState(() {
                _selectedTab = 0;
              });
            },
            icon: FaIcon(
              FontAwesomeIcons.expand,
              color: _selectedTab == 0
                  ? Color(0xffFEFDFE)
                  : Color(0xffFEFDFE).withOpacity(0.5),
            ),
            title: Text(
              'ترکر',
              style: _selectedTab == 0
                  ? _selectedTabTextStyle
                  : _unSelectedTabStyle,
            ),
          ),
          CBottomNavigationItem(
            onTap: () {
              setState(() {
                _selectedTab = 1;
              });
            },
            icon: FaIcon(
              FontAwesomeIcons.home,
              color: _selectedTab == 1
                  ? Color(0xffFEFDFE)
                  : Color(0xffFEFDFE).withOpacity(0.5),
            ),
            title: Text(
              'خانه',
              style: _selectedTab == 1
                  ? _selectedTabTextStyle
                  : _unSelectedTabStyle,
            ),
          ),
          CBottomNavigationItem(
            onTap: () {
              setState(() {
                _selectedTab = 2;
              });
            },
            icon: FaIcon(
              FontAwesomeIcons.solidNewspaper,
              color: _selectedTab == 2
                  ? Color(0xffFEFDFE)
                  : Color(0xffFEFDFE).withOpacity(0.5),
            ),
            title: Text(
              'اخبار',
              style: _selectedTab == 2
                  ? _selectedTabTextStyle
                  : _unSelectedTabStyle,
            ),
          ),
          CBottomNavigationItem(
            onTap: () {
              setState(() {
                _selectedTab = 3;
              });
            },
            icon: FaIcon(
              FontAwesomeIcons.twitter,
              color: _selectedTab == 3
                  ? Color(0xffFEFDFE)
                  : Color(0xffFEFDFE).withOpacity(0.5),
            ),
            title: Text(
              ' توییت ها',
              style: _selectedTab == 3
                  ? _selectedTabTextStyle
                  : _unSelectedTabStyle,
            ),
          ),
        ],
      ),
      body: _screens[_selectedTab],
    );
  }
}

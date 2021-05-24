import 'package:crypto_tracker/app.dart';

import 'package:crypto_tracker/screens/home_route/profile_screen.dart';
import 'package:crypto_tracker/screens/login_route/login_screen.dart';
import 'package:crypto_tracker/screens/splash_screen.dart';
import 'package:crypto_tracker/screens/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(InitailClass());
}

class InitailClass extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => SplashScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        App.routeName: (ctx) => App(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        TermsAndConditionsScreen.routeName: (ctx) => TermsAndConditionsScreen(),
      },
      theme: ThemeData(
        primaryColor: HexColor('#D5D4E0'),
        scaffoldBackgroundColor: HexColor('#2E2E47'),
        backgroundColor: HexColor('#414063'),
        accentColor: Color(0xffFA8842),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff2E2E47),
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: HexColor('#FEFDFE').withOpacity(0.5),
          ),
        ),
        iconTheme: IconThemeData(
          color: HexColor('#FEFDFE').withOpacity(0.5),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 16,
            color: HexColor('#FEFDFE').withOpacity(0.5),
          ),
          headline3: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: HexColor('#FEFDFE'),
          ),
          headline5: TextStyle(
            fontSize: 18,
            color: HexColor('#FEFDFE'),
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            color: HexColor('#FEFDFE').withOpacity(0.5),
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            color: HexColor('#FEFDFE').withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}

import 'package:crypto_tracker/app.dart';
import 'package:crypto_tracker/screens/login_route/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/application.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List _cryptoList;
  String uuid = Application.deviceIdentifier;

  @override
  void initState() {
    super.initState();

    initialization();
  }

  void initialization() {
    Application.convertFutureToListOfCryptoModel();
    Application.convertFutureToListOfCryptoNewsModel();
    Application.convertFutureToListOfCryptoTweetsModel();
    Application.convertFutureToUserModelObject();
    startTimer();
  }

  Timer _timer;
  int _start = 7;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_cryptoList != null) {
          if (this.mounted)
            setState(() {
              _timer.cancel();
              !Application.hasLogedIn
                  ? Navigator.of(context).pushNamed(LoginScreen.routeName)
                  : Navigator.of(context).pushNamed(App.routeName);
            });
        } else if (_start == 0 && _cryptoList == null) {
          if (this.mounted) {
            _timer.cancel();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 15),
                action: SnackBarAction(
                    label: 'تلاش مجدد',
                    onPressed: () {
                      setState(() {
                        _start = 5;
                      });
                      initialization();
                    }),
                content: Text(
                  'اینترنت دستگاه خود را چک کنید',
                  textDirection: TextDirection.rtl,
                ),
              ),
            );
          }
        } else {
          if (this.mounted)
            setState(() {
              _start--;
              _cryptoList = Application.cryptoList;
              uuid = Application.deviceIdentifier;
            });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('به کریپتوترکر خوش‌آمدید'),
          )
        ],
      ),
    ));
  }
}

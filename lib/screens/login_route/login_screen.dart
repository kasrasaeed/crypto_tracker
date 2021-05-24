import 'package:crypto_tracker/app.dart';
import 'package:crypto_tracker/models/application.dart';
import 'package:crypto_tracker/screens/terms_and_conditions_screen.dart';
import 'package:crypto_tracker/widgets/action_text.dart';
import 'package:crypto_tracker/widgets/error_text.dart';
import 'package:crypto_tracker/widgets/floating_action_bar.dart';
import 'package:crypto_tracker/widgets/floating_action_buttons/custom_floating_action_button.dart';
import 'package:crypto_tracker/widgets/floating_action_buttons/outlined_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = '/login_screen';
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  int _digitsCount = 0;

  bool _hasError = false;
  bool _isChanged = false;

  bool _isClicked = false;
  double _progress = 0;
  String _errorText = '';
  TextEditingController _numberFieldController = TextEditingController();
  //String _phoneNumber;

  List<Widget> _staticPartOfPage() {
    // todo: making height and sizing inherited
    //todo: describe a theme for text
    return [
      SizedBox(
        height: MediaQuery.of(context).padding.top,
      ),
      Text(
        'شماره موبایل خود را وارد گنید',
        style: Theme.of(context).textTheme.headline5,
        textDirection: TextDirection.rtl,
      ),
      SizedBox(
        height: 20,
      ),
    ];
  }

  Widget _formScaffold(Widget child) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border(
          top: BorderSide(
            width: 1,
            color: !_hasError && !_isChanged
                ? Color(0xffDFD4CE)
                : Color(0xffBB2222),
          ),
          bottom: BorderSide(
            width: 1,
            color: !_hasError && !_isChanged
                ? Color(0xffDFD4CE)
                : Color(0xffBB2222),
          ),
          right: BorderSide(
            width: 1,
            color: !_hasError && !_isChanged
                ? Color(0xffDFD4CE)
                : Color(0xffBB2222),
          ),
          left: BorderSide(
            width: 1,
            color: !_hasError && !_isChanged
                ? Color(0xffDFD4CE)
                : Color(0xffBB2222),
          ),
        ),
      ),
      child: child,
    );
  }

  void _errorHandler(String value) {
    setState(() {
      int count = value.length;
      if (count < 11 && 0 < count) {
        _digitsCount = 0;
        _isChanged = true;
        _hasError = true;
        _errorText = 'شماره باید 11 کاراکتر باشد';
      } else if (count >= 11 && value.contains('09')) {
        _digitsCount = 1;
        _isChanged = false;
        _hasError = false;
        _errorText = '';
      } else if (count == 0) {
        _digitsCount = -1;
        _isChanged = true;
        _hasError = true;
        _errorText = 'شماره خود را وارد کنید';
      } else if (!value.contains('09')) {
        _digitsCount = -2;
        _isChanged = true;
        _hasError = true;
        _errorText = 'شماره معتبر نیست';
      }
    });
  }

  Widget build(context) {
    void _toTermsScreen() {
      Navigator.of(context).pushNamed(TermsAndConditionsScreen.routeName);
    }

    double _pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'ورود',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(App.routeName);
              },
              child: Text(
                'بعدی',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // static part of page which includes Text Widgets and also spacing
                ..._staticPartOfPage(),
                //
                _formScaffold(
                  Row(
                    children: [
                      //Part: Form
                      Form(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                          ),
                          child: TextFormField(
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(11),
                            ],
                            textAlignVertical: TextAlignVertical.center,
                            style: Theme.of(context).textTheme.headline5,
                            keyboardType: TextInputType.phone,
                            controller:
                                _numberFieldController, //cut this code and paste to onTap on floating then add controller.
                            onChanged: (value) {
                              setState(() {
                                if (value.length >= 11 &&
                                    value.contains('09')) {
                                  _digitsCount = 1;
                                  _isChanged = false;
                                  _errorText = '';
                                } else {
                                  _digitsCount = 0;
                                }
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '09xx xxxxxxx',
                              hintStyle: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ErrorText(_errorText),
              ],
            ),
            _digitsCount == 0 || _digitsCount == -1 || _digitsCount == -2
                ? FloatingActionBar(
                    actionBarText2: ActionText(
                      onTap: _toTermsScreen,
                      text: 'شرایط و ضوابط',
                    ),
                    outLinedFloatingActionButton: OutLinedFloatingActionButton(
                      color: Colors.white70,
                      onTap: () => _errorHandler(_numberFieldController.text),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 38,
                        color: !_hasError && !_isChanged
                            ? Theme.of(context).accentColor
                            : Color(0xffBB2222),
                      ),
                      errorEnabled: !_hasError && _isChanged,
                    ),
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: _pageWidth,
                  )
                : FloatingActionBar(
                    actionBarText2: ActionText(
                      onTap: _toTermsScreen,
                      text: 'شرایط و ضوابط',
                    ),
                    customFloatingActionButton: CustomFloatingActionButton(
                      color: Theme.of(context).accentColor,
                      child: _isClicked
                          ? Padding(
                              padding: const EdgeInsets.all(12),
                              child: CircularProgressIndicator(
                                color: Theme.of(context).accentColor,
                                value: _progress,
                              ),
                            )
                          : Icon(
                              Icons.arrow_forward_rounded,
                              size: 38,
                              color: Color(0xff454545),
                            ),
                      onTap: () {
                        Application.httpPostUser(
                          Application.deviceIdentifier,
                          _numberFieldController.text,
                        );
                        Navigator.of(context).pushNamed(App.routeName);
                      },
                    ),
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: _pageWidth,
                  ),
          ],
        ),
      ),
    );
  }
}

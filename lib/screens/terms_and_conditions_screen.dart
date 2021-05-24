import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  static final routeName = '/terms-and-conditions-screen';
  Widget _appBar(preScreen, context) {
    return AppBar(
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
        'شرایط و ضوابط',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  void _preScreen(context) {
    Navigator.of(context).pop();
  }

  Widget build(context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: _appBar(() => _preScreen(context), context),
      body: Container(
        width: _mediaQuery.size.width,
        height: _mediaQuery.size.height,
        padding: EdgeInsets.all(14),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                style: BorderStyle.solid,
                color: HexColor('#E4E0E2'),
              ),
              right: BorderSide(
                style: BorderStyle.solid,
                color: HexColor('#E4E0E2'),
              ),
              bottom: BorderSide(
                style: BorderStyle.solid,
                color: HexColor('#E4E0E2'),
              ),
              left: BorderSide(
                style: BorderStyle.solid,
                color: HexColor('#E4E0E2'),
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '''لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.''',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}

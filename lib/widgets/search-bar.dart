import 'package:crypto_tracker/porvider/filter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  Widget build(context) {
    return Positioned(
      top: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: 5,
          right: 5,
          left: 5,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.04,
                child: Stack(
                  children: [
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.08,
                      child: SvgPicture.asset(
                        'assets/images/logo.svg',
                        width: 25,
                        height: 25,
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.44,
                      child: Text(
                        'خانه',
                        style: TextStyle(
                          fontSize: 22,
                          color: HexColor('#FEFDFE').withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xffFEFDFE).withOpacity(0.5),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 19,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                right: 10,
                                top: constraints.maxHeight * 0.4,
                              ),
                              height: constraints.maxHeight,
                              child: TextField(
                                onChanged: (value) {
                                  Provider.of<Filter>(context, listen: false)
                                      .filterNotify(value, true);
                                },
                                decoration: InputDecoration(
                                  hintTextDirection: TextDirection.rtl,
                                  border: InputBorder.none,
                                  hintText: 'جستوجو ...',
                                  hintStyle: TextStyle(
                                    color: HexColor('#000000'),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 1,
                            ),
                            child: Icon(
                              Icons.search,
                              size: 24,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ارز',
                        style: TextStyle(
                          fontSize: 20,
                          color: HexColor('#FEFDFE').withOpacity(0.5),
                        ),
                      ),
                      Text(
                        'قیمت',
                        style: TextStyle(
                          fontSize: 20,
                          color: HexColor('#FEFDFE').withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

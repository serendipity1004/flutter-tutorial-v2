import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String iOSTestUnitId = 'ca-app-pub-3940256099942544/2934735716';
  final String androidTestUnitId = 'ca-app-pub-3940256099942544/6300978111';

  BannerAd? banner;

  List items = [];

  @override
  void initState() {
    super.initState();

    banner = BannerAd(
      listener: AdListener(),
      size: AdSize.banner,
      adUnitId: Platform.isIOS ? iOSTestUnitId : androidTestUnitId,
      request: AdRequest(),
    )..load();

    items = List.generate(
      100,
      (index) => index,
    );

    for (int i = items.length; i >= 1; i -= 4) {
      items.insert(
        i,
        BannerAd(
          listener: AdListener(),
          size: AdSize.banner,
          adUnitId: Platform.isIOS ? iOSTestUnitId : androidTestUnitId,
          request: AdRequest(),
        )..load(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) {
                final item = this.items[index];

                if (item is int) {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      child: Center(
                        child: Text(
                          item.toString(),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 50.0,
                    child: item == null
                        ? Container()
                        : AdWidget(
                            ad: item,
                          ),
                  );
                }
              },
              separatorBuilder: (_, index) {
                return Divider();
              },
              itemCount: this.items.length,
            ),
          ),
          // Container(
          //   height: 50.0,
          //   child: this.banner == null
          //       ? Container()
          //       : AdWidget(
          //           ad: this.banner!,
          //         ),
          // ),
        ],
      ),
    );
  }
}

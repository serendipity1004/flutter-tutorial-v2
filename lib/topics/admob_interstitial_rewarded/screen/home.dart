import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final InterstitialAd interstitialAd;
  late final RewardedAd rewardedAd;

  @override
  void initState() {
    super.initState();

    interstitialAd = InterstitialAd(
      listener: AdListener(onAdClosed: (ad) {
        print('Interstitial Ad 가 종료됐습니다.');
      }),
      adUnitId: InterstitialAd.testAdUnitId,
      request: AdRequest(),
    )..load();

    rewardedAd = RewardedAd(
      listener: AdListener(onAdClosed: (ad) {
        print('Rewarded Ad 가 종료됐습니다.');
      }, onRewardedAdUserEarnedReward: (ad, item) {
        print('Rewarded Ad 에서 보상을 획득했습니다.');
      }),
      adUnitId: RewardedAd.testAdUnitId,
      request: AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                interstitialAd.show();
              },
              child: Text('Interstitial Ad'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                rewardedAd.show();
              },
              child: Text('Rewarded Ad'),
            ),
          ),
        ],
      ),
    );
  }
}

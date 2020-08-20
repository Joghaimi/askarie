import 'package:firebase_admob/firebase_admob.dart';

class ADS{
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      nonPersonalizedAds: true,
      keywords: <String>['student','collage','Young','arab','jordan','learn','engineer']
  );





   InterstitialAd getNewInterstital(){
    return InterstitialAd(
      adUnitId:'ca-app-pub-9661386178168248/6766621774', //  ca-app-pub-9661386178168248/6766621774
      targetingInfo: targetingInfo,
    );
  }
  BannerAd getNewBannerAd(){
     return BannerAd(
       adUnitId:'ca-app-pub-9661386178168248/9731696464',//// Change the ID ca-app-pub-9661386178168248/9731696464
       size: AdSize.fullBanner,
       targetingInfo: targetingInfo,
     );
  }
}
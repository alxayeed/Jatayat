import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  NativeAd? _preloadedNativeAd;
  bool _isNativeLoading = false;

  BannerAd? _preloadedBannerAd;
  bool _isBannerLoading = false;

  AdService();

  bool get areAdsEnabled => dotenv.env['SHOW_ADS'] == 'true';

  String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return dotenv.env['AD_NATIVE_ANDROID'] ?? 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return dotenv.env['AD_NATIVE_IOS'] ?? 'ca-app-pub-3940256099942544/3986624511';
    }
    return '';
  }

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return dotenv.env['AD_BANNER_ANDROID'] ?? 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return dotenv.env['AD_BANNER_IOS'] ?? 'ca-app-pub-3940256099942544/2934735716';
    }
    return '';
  }

  Future<void> initialize() async {
    if (!areAdsEnabled) return;
    try {
      await MobileAds.instance.initialize();
      debugPrint('🚀 MobileAds initialized successfully.');
      preloadNativeAd();
      preloadBannerAd();
    } catch (e) {
      debugPrint('❌ MobileAds failed to initialize: $e');
    }
  }

  // Preloads the Native template ad inside cache
  void preloadNativeAd() {
    if (!areAdsEnabled || _isNativeLoading || _preloadedNativeAd != null) return;
    _isNativeLoading = true;

    _preloadedNativeAd = NativeAd(
      adUnitId: nativeAdUnitId,
      factoryId: null,
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.small,
        cornerRadius: 24.0,
      ),
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          _isNativeLoading = false;
          debugPrint('🎯 Background Native Ad loaded in cache.');
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          _preloadedNativeAd = null;
          _isNativeLoading = false;
          debugPrint('❌ Background Native Ad failed to cache: $error');
        },
      ),
    )..load();
  }

  // Preloads the Fallback Banner ad inside cache
  void preloadBannerAd() {
    if (!areAdsEnabled || _isBannerLoading || _preloadedBannerAd != null) return;
    _isBannerLoading = true;

    _preloadedBannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _isBannerLoading = false;
          debugPrint('🎯 Background Fallback Banner Ad loaded in cache.');
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          _preloadedBannerAd = null;
          _isBannerLoading = false;
          debugPrint('❌ Background Fallback Banner Ad failed to cache: $error');
        },
      ),
    )..load();
  }

  // Consumes cached Native ad and schedules next reload
  NativeAd? consumeNativeAd() {
    final ad = _preloadedNativeAd;
    _preloadedNativeAd = null;
    preloadNativeAd(); // Refill ad cache
    return ad;
  }

  // Consumes cached Banner ad and schedules next reload
  BannerAd? consumeBannerAd() {
    final ad = _preloadedBannerAd;
    _preloadedBannerAd = null;
    preloadBannerAd(); // Refill ad cache
    return ad;
  }
}

final adServiceProvider = Provider<AdService>((ref) => AdService());

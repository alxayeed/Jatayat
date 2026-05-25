import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../providers/ad_provider.dart';

class AppNativeAdCard extends ConsumerStatefulWidget {
  const AppNativeAdCard({super.key});

  @override
  ConsumerState<AppNativeAdCard> createState() => _AppNativeAdCardState();
}

class _AppNativeAdCardState extends ConsumerState<AppNativeAdCard> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  BannerAd? _bannerAd;
  bool _isBannerLoaded = false;
  bool _useBannerFallback = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  void _loadAd() {
    final adService = ref.read(adServiceProvider);
    if (!adService.areAdsEnabled) return;

    if (_useBannerFallback) {
      if (_bannerAd != null) return;

      // Consume background preloaded banner ad if ready
      final cachedBanner = adService.consumeBannerAd();
      if (cachedBanner != null) {
        _bannerAd = cachedBanner;
        _isBannerLoaded = true;
        debugPrint('🎯 Instantly consumed cached Fallback Banner Ad.');
      } else {
        // Fallback to local loading if cache not ready
        _bannerAd = BannerAd(
          adUnitId: adService.bannerAdUnitId,
          size: AdSize.banner,
          request: const AdRequest(),
          listener: BannerAdListener(
            onAdLoaded: (ad) {
              if (mounted) {
                setState(() {
                  _isBannerLoaded = true;
                });
              }
              debugPrint('🎯 Local Fallback Banner Ad Loaded successfully.');
            },
            onAdFailedToLoad: (ad, error) {
              ad.dispose();
              debugPrint('❌ Local Fallback Banner Ad failed to load: $error');
            },
          ),
        )..load();
      }
    } else {
      if (_nativeAd != null) return;

      // Consume background preloaded native ad if ready
      final cachedNative = adService.consumeNativeAd();
      if (cachedNative != null) {
        _nativeAd = cachedNative;
        _isAdLoaded = true;
        debugPrint('🎯 Instantly consumed cached Native Ad.');
      } else {
        final theme = Theme.of(context);
        
        // Fallback to local loading if cache not ready
        _nativeAd = NativeAd(
          adUnitId: adService.nativeAdUnitId,
          factoryId: null,
          nativeTemplateStyle: NativeTemplateStyle(
            templateType: TemplateType.small,
            mainBackgroundColor: theme.colorScheme.surfaceContainerLowest,
            cornerRadius: 24.0,
            callToActionTextStyle: NativeTemplateTextStyle(
              textColor: theme.colorScheme.onPrimary,
              backgroundColor: theme.colorScheme.primary,
              style: NativeTemplateFontStyle.bold,
              size: 14.0,
            ),
            primaryTextStyle: NativeTemplateTextStyle(
              textColor: theme.colorScheme.onSurface,
              style: NativeTemplateFontStyle.bold,
              size: 15.0,
            ),
            secondaryTextStyle: NativeTemplateTextStyle(
              textColor: theme.colorScheme.onSurfaceVariant,
              size: 13.0,
            ),
          ),
          request: const AdRequest(),
          listener: NativeAdListener(
            onAdLoaded: (ad) {
              if (mounted) {
                setState(() {
                  _isAdLoaded = true;
                });
              }
              debugPrint('🎯 Local Native Ad Loaded successfully.');
            },
            onAdFailedToLoad: (ad, error) {
              ad.dispose();
              _nativeAd = null;
              debugPrint('❌ Local Native Ad failed to load: $error. Falling back to Banner Ad!');
              if (mounted) {
                setState(() {
                  _useBannerFallback = true;
                });
                _loadAd();
              }
            },
          ),
        )..load();
      }
    }
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adService = ref.watch(adServiceProvider);
    if (!adService.areAdsEnabled) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    if (_useBannerFallback) {
      if (_bannerAd == null || !_isBannerLoaded) {
        return const SizedBox.shrink();
      }

      return Container(
        height: 60, // Standard compact banner height with spacing
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            width: 1.0,
          ),
        ),
        child: AdWidget(ad: _bannerAd!),
      );
    }

    if (_nativeAd == null || !_isAdLoaded) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 100, // Small native ad standard height
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.1),
          width: 1.0,
        ),
      ),
      child: AdWidget(ad: _nativeAd!),
    );
  }
}

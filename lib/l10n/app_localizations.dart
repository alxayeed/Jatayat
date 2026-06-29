import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Jatayat'**
  String get appName;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Where to?'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find fares across Dhaka City'**
  String get homeSubtitle;

  /// No description provided for @homeMenu.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeMenu;

  /// No description provided for @routesMenu.
  ///
  /// In en, this message translates to:
  /// **'Routes'**
  String get routesMenu;

  /// No description provided for @docsMenu.
  ///
  /// In en, this message translates to:
  /// **'Charts'**
  String get docsMenu;

  /// No description provided for @bookmarksMenu.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmarksMenu;

  /// No description provided for @currencySign.
  ///
  /// In en, this message translates to:
  /// **'৳'**
  String get currencySign;

  /// No description provided for @gazzette.
  ///
  /// In en, this message translates to:
  /// **'Gazette'**
  String get gazzette;

  /// No description provided for @km.
  ///
  /// In en, this message translates to:
  /// **'km'**
  String get km;

  /// No description provided for @taka.
  ///
  /// In en, this message translates to:
  /// **'Taka'**
  String get taka;

  /// No description provided for @minFare.
  ///
  /// In en, this message translates to:
  /// **'Min Fare'**
  String get minFare;

  /// No description provided for @searchFares.
  ///
  /// In en, this message translates to:
  /// **'Search Fares'**
  String get searchFares;

  /// No description provided for @fromStop.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get fromStop;

  /// No description provided for @toStop.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get toStop;

  /// No description provided for @findBus.
  ///
  /// In en, this message translates to:
  /// **'See Fare'**
  String get findBus;

  /// No description provided for @fareSearchChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get fareSearchChange;

  /// No description provided for @recentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get recentSearches;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// No description provided for @allRoutes.
  ///
  /// In en, this message translates to:
  /// **'All Routes'**
  String get allRoutes;

  /// No description provided for @routeDetails.
  ///
  /// In en, this message translates to:
  /// **'Route Details'**
  String get routeDetails;

  /// No description provided for @totalStops.
  ///
  /// In en, this message translates to:
  /// **'Total Stops'**
  String get totalStops;

  /// No description provided for @totalDistance.
  ///
  /// In en, this message translates to:
  /// **'Total Distance'**
  String get totalDistance;

  /// No description provided for @viewSource.
  ///
  /// In en, this message translates to:
  /// **'View Official Document'**
  String get viewSource;

  /// No description provided for @stopsSearchErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Sorry, no route data found for this stop in the database.'**
  String get stopsSearchErrorMessage;

  /// No description provided for @fareSearchErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Sorry, this information is not available in the database.'**
  String get fareSearchErrorMessage;

  /// No description provided for @calculatedFareErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Please select a departure and destination stop first.'**
  String get calculatedFareErrorMessage;

  /// No description provided for @loadingStopsError.
  ///
  /// In en, this message translates to:
  /// **'Loading destination stops, please wait...'**
  String get loadingStopsError;

  /// No description provided for @fareDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Fare Details'**
  String get fareDetailsTitle;

  /// No description provided for @fareRatePrefix.
  ///
  /// In en, this message translates to:
  /// **'Fare rate: per passenger per kilometer'**
  String get fareRatePrefix;

  /// No description provided for @routeDistancePrefix.
  ///
  /// In en, this message translates to:
  /// **'Total route distance'**
  String get routeDistancePrefix;

  /// No description provided for @kilometerSuffix.
  ///
  /// In en, this message translates to:
  /// **'kilometers.'**
  String get kilometerSuffix;

  /// No description provided for @journeyStart.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get journeyStart;

  /// No description provided for @destination.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get destination;

  /// No description provided for @travelDistance.
  ///
  /// In en, this message translates to:
  /// **'Travel Distance'**
  String get travelDistance;

  /// No description provided for @routeCode.
  ///
  /// In en, this message translates to:
  /// **'Route Code'**
  String get routeCode;

  /// No description provided for @reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// No description provided for @page.
  ///
  /// In en, this message translates to:
  /// **'Page'**
  String get page;

  /// No description provided for @officialFare.
  ///
  /// In en, this message translates to:
  /// **'Official Fare'**
  String get officialFare;

  /// No description provided for @calculatedFare.
  ///
  /// In en, this message translates to:
  /// **'Calculated'**
  String get calculatedFare;

  /// No description provided for @routeStoppages.
  ///
  /// In en, this message translates to:
  /// **'Route Stops'**
  String get routeStoppages;

  /// No description provided for @failedToLoadStops.
  ///
  /// In en, this message translates to:
  /// **'Failed to load stops'**
  String get failedToLoadStops;

  /// No description provided for @viewProof.
  ///
  /// In en, this message translates to:
  /// **'View Proof'**
  String get viewProof;

  /// No description provided for @brtaLink.
  ///
  /// In en, this message translates to:
  /// **'BRTA Link'**
  String get brtaLink;

  /// No description provided for @fareList.
  ///
  /// In en, this message translates to:
  /// **'Fare List'**
  String get fareList;

  /// No description provided for @noteMinFarePrefix.
  ///
  /// In en, this message translates to:
  /// **'Note (01): Minimum fare'**
  String get noteMinFarePrefix;

  /// No description provided for @noteMinFareSuffix.
  ///
  /// In en, this message translates to:
  /// **'.00 Taka has been used to prepare this chart. No additional amount can be charged beyond the fares listed above.'**
  String get noteMinFareSuffix;

  /// No description provided for @noteGas.
  ///
  /// In en, this message translates to:
  /// **'(02) This fare rate does not apply to gas-powered vehicles.'**
  String get noteGas;

  /// No description provided for @routeExplorer.
  ///
  /// In en, this message translates to:
  /// **'Route Explorer'**
  String get routeExplorer;

  /// No description provided for @searchRoute.
  ///
  /// In en, this message translates to:
  /// **'Search by Route Code or Name...'**
  String get searchRoute;

  /// No description provided for @noRoutesFound.
  ///
  /// In en, this message translates to:
  /// **'No routes found'**
  String get noRoutesFound;

  /// No description provided for @trySearching.
  ///
  /// In en, this message translates to:
  /// **'Try searching for a different code'**
  String get trySearching;

  /// No description provided for @failedToLoadRoutes.
  ///
  /// In en, this message translates to:
  /// **'Failed to load routes'**
  String get failedToLoadRoutes;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @routePrefix.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get routePrefix;

  /// No description provided for @noPdfAvailable.
  ///
  /// In en, this message translates to:
  /// **'No PDF available for this route.'**
  String get noPdfAvailable;

  /// No description provided for @noBrtaLink.
  ///
  /// In en, this message translates to:
  /// **'No BRTA link available for this route.'**
  String get noBrtaLink;

  /// No description provided for @failedToLoadRouteDetails.
  ///
  /// In en, this message translates to:
  /// **'Failed to load route details.'**
  String get failedToLoadRouteDetails;

  /// No description provided for @brtaDocument.
  ///
  /// In en, this message translates to:
  /// **'BRTA Document'**
  String get brtaDocument;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get themeSystem;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// No description provided for @langBangla.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get langBangla;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @checkForUpdates.
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get checkForUpdates;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @upToDate.
  ///
  /// In en, this message translates to:
  /// **'You\'re up to date!'**
  String get upToDate;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'Jatayat helps you find official bus fares across Dhaka city.'**
  String get appDescription;

  /// No description provided for @loadingGazette.
  ///
  /// In en, this message translates to:
  /// **'Loading Gazette Reference...'**
  String get loadingGazette;

  /// No description provided for @errorLoadingPdf.
  ///
  /// In en, this message translates to:
  /// **'Failed to display the document'**
  String get errorLoadingPdf;

  /// No description provided for @disclaimerHeader.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get disclaimerHeader;

  /// No description provided for @governmentDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'All fare schedules in Jatayat are sourced accurately from public BRTA gazette publications. This independent platform does not represent any government entity. Because data follows official documents strictly, some local stop names may be missing; please try searching for nearby major intersections or alternative names if yours is not found.'**
  String get governmentDisclaimer;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network connection issue. Please check your internet and try again.'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timed out. Please try again.'**
  String get errorTimeout;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested resource could not be found.'**
  String get errorNotFound;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Access denied. You are not authorized.'**
  String get errorUnauthorized;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'An internal server error occurred (500).'**
  String get errorServer;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get errorGeneric;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Jatayat App'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeDesc.
  ///
  /// In en, this message translates to:
  /// **'Navigate Dhaka city\'s bus routes, stoppages, and official fares easily.'**
  String get onboardingWelcomeDesc;

  /// No description provided for @onboardingSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Fare Finder'**
  String get onboardingSearchTitle;

  /// No description provided for @onboardingSearchDesc.
  ///
  /// In en, this message translates to:
  /// **'Select departure and destination stops to instantly find official government-authorized fares.'**
  String get onboardingSearchDesc;

  /// No description provided for @onboardingBookmarksTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved Commutes'**
  String get onboardingBookmarksTitle;

  /// No description provided for @onboardingBookmarksDesc.
  ///
  /// In en, this message translates to:
  /// **'Save your daily commute routes to access fare and transit details instantly in one tap.'**
  String get onboardingBookmarksDesc;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @regionDhaka.
  ///
  /// In en, this message translates to:
  /// **'Dhaka'**
  String get regionDhaka;

  /// No description provided for @regionChittagong.
  ///
  /// In en, this message translates to:
  /// **'Chittagong'**
  String get regionChittagong;

  /// No description provided for @selectRegion.
  ///
  /// In en, this message translates to:
  /// **'Select Region'**
  String get selectRegion;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

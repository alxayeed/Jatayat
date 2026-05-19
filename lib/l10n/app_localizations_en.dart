// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Jatayat';

  @override
  String get homeTitle => 'Where to?';

  @override
  String get homeSubtitle => 'Find fares across Dhaka City';

  @override
  String get currencySign => '৳';

  @override
  String get gazzette => 'Gazette';

  @override
  String get km => 'km';

  @override
  String get taka => 'Taka';

  @override
  String get minFare => 'Min Fare';

  @override
  String get searchFares => 'Search Fares';

  @override
  String get fromStop => 'From';

  @override
  String get toStop => 'To';

  @override
  String get findBus => 'See Fare';

  @override
  String get fareSearchChange => 'Change';

  @override
  String get recentSearches => 'Recent Searches';

  @override
  String get results => 'Results';

  @override
  String get allRoutes => 'All Routes';

  @override
  String get routeDetails => 'Route Details';

  @override
  String get totalStops => 'Total Stops';

  @override
  String get totalDistance => 'Total Distance';

  @override
  String get viewSource => 'View Official Document';

  @override
  String get stopsSearchErrorMessage =>
      'Sorry, no route data found for this stop in the database.';

  @override
  String get fareSearchErrorMessage =>
      'Sorry, this information is not available in the database.';

  @override
  String get calculatedFareErrorMessage =>
      'Please select a departure and destination stop first.';

  @override
  String get fareDetailsTitle => 'Fare Details';

  @override
  String get fareRatePrefix => 'Fare rate: per passenger per kilometer';

  @override
  String get routeDistancePrefix => 'Total route distance';

  @override
  String get kilometerSuffix => 'kilometers.';

  @override
  String get journeyStart => 'From';

  @override
  String get destination => 'To';

  @override
  String get travelDistance => 'Travel Distance';

  @override
  String get routeCode => 'Route Code';

  @override
  String get reference => 'Reference';

  @override
  String get page => 'Page';

  @override
  String get officialFare => 'Official Fare';

  @override
  String get calculatedFare => 'Calculated';

  @override
  String get routeStoppages => 'Route Stops';

  @override
  String get failedToLoadStops => 'Failed to load stops';

  @override
  String get viewProof => 'View Proof';

  @override
  String get brtaLink => 'BRTA Link';

  @override
  String get fareList => 'Fare List';

  @override
  String get noteMinFarePrefix => 'Note (01): Minimum fare';

  @override
  String get noteMinFareSuffix =>
      '.00 Taka has been used to prepare this chart. No additional amount can be charged beyond the fares listed above.';

  @override
  String get noteGas =>
      '(02) This fare rate does not apply to gas-powered vehicles.';

  @override
  String get routeExplorer => 'Route Explorer';

  @override
  String get searchRoute => 'Search by Route Code or Name...';

  @override
  String get noRoutesFound => 'No routes found';

  @override
  String get trySearching => 'Try searching for a different code';

  @override
  String get failedToLoadRoutes => 'Failed to load routes';

  @override
  String get retry => 'Retry';

  @override
  String get routePrefix => 'Route';

  @override
  String get noPdfAvailable => 'No PDF available for this route.';

  @override
  String get noBrtaLink => 'No BRTA link available for this route.';

  @override
  String get failedToLoadRouteDetails => 'Failed to load route details.';

  @override
  String get brtaDocument => 'BRTA Document';

  @override
  String get settings => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get theme => 'Theme';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System Default';

  @override
  String get language => 'Language';

  @override
  String get langEnglish => 'English';

  @override
  String get langBangla => 'বাংলা';

  @override
  String get general => 'General';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get checkForUpdates => 'Check for Updates';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get upToDate => 'You\'re up to date!';

  @override
  String get appDescription =>
      'Jatayat helps you find official bus fares across Dhaka city.';

  @override
  String get loadingGazette => 'Loading Gazette Reference...';

  @override
  String get errorLoadingPdf => 'Failed to display the document';
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jatayat/core/providers/settings_provider.dart';
import 'package:jatayat/core/router/app_router.dart';
import 'package:jatayat/features/fare_finder/domain/entities/fair_result_entity/fare_result_entity.dart';
import 'package:jatayat/features/fare_finder/presentation/widgets/fare_card.dart';
import 'package:jatayat/l10n/app_localizations.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Animation controller for continuous premium micro-animations
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _completeOnboarding() {
    ref.read(settingsProvider.notifier).completeOnboarding();
    context.go(AppRoutes.fareSearch);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [const Color(0xFF1E261D), const Color(0xFF111318)]
                : [const Color(0xFFE8F5E9), const Color(0xFFF7FBF1)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Bar with Language Toggle and Skip Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Language Switcher
                    if (dotenv.env['ALLOW_LANGUAGE_SWITCHING'] == 'true')
                      _buildLanguageToggle(),

                    // Skip Button
                    AnimatedOpacity(
                      opacity: _currentPage == 2 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: IgnorePointer(
                        ignoring: _currentPage == 2,
                        child: TextButton(
                          onPressed: _completeOnboarding,
                          child: Text(
                            l10n.onboardingSkip,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Main PageView content
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    // Slide 1: Welcome
                    _buildPage(
                      title: l10n.onboardingWelcomeTitle,
                      description: l10n.onboardingWelcomeDesc,
                      illustration: _buildWelcomeIllustration(),
                    ),
                    // Slide 2: Smart Search
                    _buildPage(
                      title: l10n.onboardingSearchTitle,
                      description: l10n.onboardingSearchDesc,
                      illustration: _buildSearchIllustration(),
                    ),
                    // Slide 3: Offline Bookmarks
                    _buildPage(
                      title: l10n.onboardingBookmarksTitle,
                      description: l10n.onboardingBookmarksDesc,
                      illustration: _buildBookmarksIllustration(),
                    ),
                  ],
                ),
              ),

              // Bottom control area
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Indicator dots
                    Row(
                      children: List.generate(
                        3,
                        (index) => _buildIndicatorDot(index),
                      ),
                    ),

                    // Navigation Action Button
                    _buildActionButton(l10n),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Page view slide builder ---
  Widget _buildPage({
    required String title,
    required String description,
    required Widget illustration,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration section
          Expanded(
            flex: 5,
            child: Center(
              child: AspectRatio(aspectRatio: 1.4, child: illustration),
            ),
          ),

          // const SizedBox(height: 16),

          // Details section
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    height: 1.2,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : const Color(0xFF00300A),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFFB0B3BE)
                        : const Color(0xFF4A5568),
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Page Dot Indicator ---
  Widget _buildIndicatorDot(int index) {
    final isActive = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  // --- Morphing Action Button ---
  Widget _buildActionButton(AppLocalizations l10n) {
    final isLastPage = _currentPage == 2;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      width: isLastPage ? 180.0 : 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(isLastPage ? 16.0 : 30.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(isLastPage ? 16.0 : 30.0),
          onTap: () {
            if (isLastPage) {
              _completeOnboarding();
            } else {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Center(
            child: AnimatedCrossFade(
              firstChild: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 24,
              ),
              secondChild: Text(
                l10n.onboardingGetStarted,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              crossFadeState: isLastPage
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
          ),
        ),
      ),
    );
  }

  // --- Custom Premium Language Toggle ---
  Widget _buildLanguageToggle() {
    final settings = ref.watch(settingsProvider);
    final isBangla = settings.locale.languageCode == 'bn';

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white10
            : const Color(0xFFE2E8F0),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLanguageOption('EN', !isBangla),
          _buildLanguageOption('বাং', isBangla),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          ref
              .read(settingsProvider.notifier)
              .setLocale(
                label == 'EN' ? const Locale('en') : const Locale('bn'),
              );
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Theme.of(context).brightness == Brightness.dark
                ? Colors.white70
                : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // 1. Slide 1 Welcome Illustration (Mock Search Screen)
  Widget _buildWelcomeIllustration() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final isBn = l10n.localeName == 'bn';

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2028) : Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // "From" Stop field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.04)
                  : const Color(0xFFF7FBF1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.15),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.my_location,
                  color: theme.colorScheme.primary,
                  size: 18,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    isBn ? "আগারগাঁও" : "Agargaon",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white70 : Colors.black87,
                      fontSize: 14,
                      fontFamily: isBn ? 'HindSiliguri' : null,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Connecting line
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 20,
                width: 2,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ),

          // "To" Stop field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.04)
                  : const Color(0xFFF7FBF1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.15),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.redAccent,
                  size: 18,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    isBn ? "আজিমপুর" : "Azimpur",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white70 : Colors.black87,
                      fontSize: 14,
                      fontFamily: isBn ? 'HindSiliguri' : null,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Search button
          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text(
                  l10n.findBus,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: isBn ? 'HindSiliguri' : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 2. Slide 2 Search & Fare Illustration (FareCard Widget)
  Widget _buildSearchIllustration() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final mockFare = FareResultEntity(
      fareId: 'mock_fare_1',
      fareAmount: 19.0,
      travelDistanceKm: 7.5,
      fromStopId: 'stop_agargaon',
      toStopId: 'stop_azimpur',
      originNameBn: 'আগারগাঁও',
      originNameEn: 'Agargaon',
      destinationNameBn: 'আজিমপুর',
      destinationNameEn: 'Azimpur',
      routeId: 'route_a_459',
      routeCode: 'A-459',
      routeNameBn: 'মানিকদি (ইসিবি মোড়) থেকে আজিমপুর',
      routeNameEn: 'Manikdi (ECB More) to Azimpur',
      routeTotalDistance: 15.3,
      pdfPage: 28,
      pdfUrl: null,
      btrcUrl: null,
      baseRate: 2.53,
      minFare: 10.0,
    );

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2028) : Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: FareCard(fare: mockFare),
    );
  }

  // 3. Slide 3 Bookmarks & Offline Illustration (Fare Details Card style with bookmark ticked)
  Widget _buildBookmarksIllustration() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final isBn = l10n.localeName == 'bn';

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2028) : Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Mini AppBar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_rounded,
                size: 20,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
              Text(
                l10n.fareDetailsTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: isBn ? 'HindSiliguri' : null,
                ),
              ),
              Icon(
                Icons.bookmark_rounded,
                size: 20,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Top Header text
          // Text(
          //   isBn
          //       ? 'ভাড়ার হার: প্রতি যাত্রী প্রতি কিলোমিটার ২.৫৩ টাকা'
          //       : 'Fare rate: per passenger per kilometer 2.53 Taka',
          //   style: TextStyle(
          //     fontSize: 9,
          //     fontWeight: FontWeight.bold,
          //     color: theme.colorScheme.primary,
          //     fontFamily: isBn ? 'HindSiliguri' : null,
          //   ),
          // ),
          // const SizedBox(height: 2),
          // Text(
          //   isBn
          //       ? 'মোট রুটের দূরত্ব ১৫.৩ কিলোমিটার।'
          //       : 'Total route distance 15.3 kilometers.',
          //   style: TextStyle(
          //     fontSize: 9,
          //     fontWeight: FontWeight.bold,
          //     color: isDark ? Colors.white70 : Colors.black87,
          //     fontFamily: isBn ? 'HindSiliguri' : null,
          //   ),
          // ),
          // const SizedBox(height: 4),
          Text(
            isBn
                ? 'মানিকদি (ইসিবি মোড়) থেকে আজিমপুর'
                : 'Manikdi (ECB More) to Azimpur',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
              fontFamily: isBn ? 'HindSiliguri' : null,
            ),
          ),
          const SizedBox(height: 6),

          // Main Card
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Column(
              children: [
                // Timeline Row
                Row(
                  children: [
                    Icon(
                      Icons.radio_button_checked,
                      size: 14,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        isBn ? "আগারগাঁও" : "Agargaon",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          fontFamily: isBn ? 'HindSiliguri' : null,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        isBn ? "আজিমপুর" : "Azimpur",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          fontFamily: isBn ? 'HindSiliguri' : null,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
                const Divider(height: 14, thickness: 0.5),

                // Specs Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMiniStat(
                      l10n.travelDistance,
                      isBn ? '৭.৫ কি.মি.' : '7.5 km',
                      theme,
                      isBn,
                    ),
                    _buildMiniStat(l10n.routeCode, 'A-459', theme, isBn),
                    _buildMiniStat(
                      l10n.reference,
                      isBn ? 'পৃষ্ঠা ২৮' : 'Page 28',
                      theme,
                      isBn,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Fare details row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.officialFare,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: isBn ? 'HindSiliguri' : null,
                      ),
                    ),
                    Text(
                      '${l10n.currencySign}19',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.calculatedFare,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: isBn ? 'HindSiliguri' : null,
                      ),
                    ),
                    Text(
                      '${l10n.currencySign}18.97',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(
    String label,
    String value,
    ThemeData theme,
    bool isBn,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            color: theme.colorScheme.onSurfaceVariant,
            fontFamily: isBn ? 'HindSiliguri' : null,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          value,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            fontFamily: isBn ? 'HindSiliguri' : null,
          ),
        ),
      ],
    );
  }
}

// Custom Grid background painter for map illustration
class GridPainter extends CustomPainter {
  final bool isDark;

  GridPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isDark
          ? Colors.white.withValues(alpha: 0.03)
          : Colors.black.withValues(alpha: 0.03)
      ..strokeWidth = 1.0;

    const double step = 20.0;

    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Transit Map painter with curved paths
class TransitMapPainter extends CustomPainter {
  final double pulseValue;
  final bool isDark;
  final Color primaryColor;
  final Color accentColor;

  TransitMapPainter({
    required this.pulseValue,
    required this.isDark,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Green line path
    final path1 = Path()
      ..moveTo(size.width * 0.15, size.height * 0.8)
      ..cubicTo(
        size.width * 0.35,
        size.height * 0.75,
        size.width * 0.2,
        size.height * 0.3,
        size.width * 0.8,
        size.height * 0.25,
      );

    // Accent line path (yellow/orange)
    final path2 = Path()
      ..moveTo(size.width * 0.15, size.height * 0.2)
      ..cubicTo(
        size.width * 0.5,
        size.height * 0.25,
        size.width * 0.5,
        size.height * 0.75,
        size.width * 0.85,
        size.height * 0.8,
      );

    final linePaint1 = Paint()
      ..color = primaryColor.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    final linePaint2 = Paint()
      ..color = accentColor.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    // Draw lines
    canvas.drawPath(path1, linePaint1);
    canvas.drawPath(path2, linePaint2);

    // Draw key transit stops
    final dotPaint = Paint()..style = PaintingStyle.fill;
    final outerRingPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    void drawStop(Offset offset, Color color, double radius) {
      // Glow ring
      outerRingPaint.color = color.withValues(
        alpha: 0.3 + (0.5 * (1 - pulseValue)),
      );
      canvas.drawCircle(offset, radius + (6 * pulseValue), outerRingPaint);

      // Inner solid stop
      dotPaint.color = isDark ? Colors.white : Colors.black87;
      canvas.drawCircle(offset, radius + 1, dotPaint);
      dotPaint.color = color;
      canvas.drawCircle(offset, radius - 1, dotPaint);
    }

    drawStop(Offset(size.width * 0.15, size.height * 0.8), primaryColor, 7);
    drawStop(Offset(size.width * 0.52, size.height * 0.5), primaryColor, 7);
    drawStop(Offset(size.width * 0.8, size.height * 0.25), primaryColor, 7);

    drawStop(Offset(size.width * 0.15, size.height * 0.2), accentColor, 6);
    drawStop(Offset(size.width * 0.85, size.height * 0.8), accentColor, 6);
  }

  @override
  bool shouldRepaint(covariant TransitMapPainter oldDelegate) {
    return oldDelegate.pulseValue != pulseValue;
  }
}

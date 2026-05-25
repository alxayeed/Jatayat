import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jatayat/core/providers/settings_provider.dart';
import 'package:jatayat/core/router/app_router.dart';
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
                    if (kDebugMode) _buildLanguageToggle(),

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
              child: AspectRatio(aspectRatio: 1.1, child: illustration),
            ),
          ),

          const SizedBox(height: 16),

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

  // ==========================================
  // --- High-Fidelity Custom Illustrations ---
  // ==========================================

  // 1. Slide 1 Welcome Illustration (Dhaka Transit Route map mockup)
  Widget _buildWelcomeIllustration() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        final double pulse = _pulseController.value;
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              children: [
                // Background grid pattern simulation
                Positioned.fill(
                  child: CustomPaint(painter: GridPainter(isDark: isDark)),
                ),

                // Transit lines paint
                Positioned.fill(
                  child: CustomPaint(
                    painter: TransitMapPainter(
                      pulseValue: pulse,
                      isDark: isDark,
                      primaryColor: Theme.of(context).colorScheme.primary,
                      accentColor: const Color(0xFFFFD600),
                    ),
                  ),
                ),

                // Floating Bus Card icon
                Positioned(
                  left: 45 + (pulse * 25),
                  top: 75 + (pulse * 15),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.directions_bus_filled_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Dhaka City",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 2. Slide 2 Search & Fare Illustration
  Widget _buildSearchIllustration() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        final double pulse = _pulseController.value;
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // "From" Stop field
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.04)
                      : const Color(0xFFF7FBF1),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.15),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.trip_origin_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 18,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Mirpur 12",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white70 : Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Winding Connecting line
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 24,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),

              // "To" Stop field
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.04)
                      : const Color(0xFFF7FBF1),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.15),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: Colors.redAccent,
                      size: 18,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Motijheel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white70 : Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Floating Calculated Fare Card
              Transform.translate(
                offset: Offset(0, -5 + (pulse * 8)),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF1B5E20), const Color(0xFF0F3A12)]
                          : [const Color(0xFFE8F5E9), const Color(0xFFC8E6C9)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withValues(
                          alpha: isDark ? 0.15 : 0.25,
                        ),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.green.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.payments_outlined,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Official Fare",
                            style: TextStyle(
                              fontSize: 10,
                              color: isDark
                                  ? Colors.white70
                                  : const Color(0xFF1B5E20),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "৳ 45.00",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 3. Slide 3 Bookmarks & Offline Illustration
  Widget _buildBookmarksIllustration() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        final double pulse = _pulseController.value;
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
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Beautiful Glassmorphic Favorite Route Card
              Positioned(
                top: 20,
                left: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.03)
                        : const Color(0xFFF7FBF1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark ? Colors.white10 : const Color(0xFFE2E8F0),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFFFD600,
                          ).withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Transform.scale(
                          scale: 0.9 + (pulse * 0.2),
                          child: const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFD600),
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mirpur 12 - Motijheel",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Route: A-202 • 15 Stops",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Glowing "100% Offline" Badge overlay
              Positioned(
                bottom: 25,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "100% Offline Guide",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
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

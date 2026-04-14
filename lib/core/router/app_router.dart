import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/fare-search',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          // Pass the routed child to the MainScreen shell
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/fare-search',
            builder: (context, state) => const FareSearchScreen(),
          ),
          GoRoute(
            path: '/route-explorer',
            builder: (context, state) => const RouteExplorerScreen(),
          ),
        ],
      ),
    ],
  );
});

// ====================================================================
// SHELL & PLACEHOLDER SCREENS (You can move these to separate files later)
// ====================================================================

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Determine which tab is active based on the current URL path
    final String location = GoRouterState.of(context).uri.path;
    final int currentIndex = location.startsWith('/route-explorer') ? 1 : 0;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          if (index == 0) {
            context.go('/fare-search');
          } else {
            context.go('/route-explorer');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            label: 'Search Fares',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_bus_rounded),
            label: 'Routes',
          ),
        ],
      ),
    );
  }
}

class FareSearchScreen extends StatelessWidget {
  const FareSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Fare Search Feature\n(Placeholder)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class RouteExplorerScreen extends StatelessWidget {
  const RouteExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Route Explorer Feature\n(Placeholder)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
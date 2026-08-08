import 'package:go_router/go_router.dart';

import '../layout/app_shell.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/planner/planner_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(
          currentPath: state.matchedLocation,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/planner',
          builder: (context, state) => const PlannerScreen(),
        ),
      ],
    ),
  ],
);
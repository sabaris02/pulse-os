import 'package:flutter/material.dart';

import '../../features/dashboard/dashboard_screen.dart';
import 'sidebar.dart';

class DesktopShell extends StatelessWidget {
  const DesktopShell({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: DashboardScreen(),
          ),
        ],
      ),
    );
  }
}
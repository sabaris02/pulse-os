import 'package:flutter/material.dart';

import '../features/dashboard/dashboard_screen.dart';
import 'theme/app_theme.dart';

class PulseApp extends StatelessWidget {
  const PulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pulse OS',
      theme: AppTheme.darkTheme,
      home: const DashboardScreen(),
    );
  }
}
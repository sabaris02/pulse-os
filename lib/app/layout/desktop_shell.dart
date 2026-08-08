import 'package:flutter/material.dart';
import 'sidebar.dart';

class DesktopShell extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const DesktopShell({
    super.key,
    required this.child,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(currentPath: currentPath),
          Expanded(child: child),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'desktop_shell.dart';
import 'mobile_shell.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const AppShell({
    super.key,
    required this.child,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 900) {
      return DesktopShell(
        currentPath: currentPath,
        child: child,
      );
    }
    return MobileShell(
      currentPath: currentPath,
      child: child,
    );
  }
}
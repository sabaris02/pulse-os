import 'package:flutter/material.dart';

class MobileShell extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const MobileShell({
    super.key,
    required this.child,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child);
  }
}
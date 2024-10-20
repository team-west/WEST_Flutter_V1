import 'package:flutter/material.dart';
import 'package:west/core/constants/west_style.dart';

class WESTLayout extends StatelessWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? floatingActionButton, bottomSheet;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const WESTLayout({
    super.key,
    required this.child,
    this.backgroundColor,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? WESTColor.background,
      appBar: appBar,
      body: SafeArea(
        child: child,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomSheet: bottomSheet,
    );
  }
}

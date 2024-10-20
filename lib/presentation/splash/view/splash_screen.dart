import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:west/core/constants/west_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1100)).then((value) => context.go("/signIn"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WESTColor.background,
      body: Center(
        child: Image.asset(
          "$imageCoreAsset/west_splash_image.png",
          width: 240,
          height: 240,
        ),
      ),
    );
  }
}

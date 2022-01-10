import 'dart:async';

import 'package:flutter/material.dart';
import 'package:udemy/res/assets.dart';
import 'package:udemy/res/colors.dart';

import '../../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNextPage);
  }

  _goNextPage() {
    Navigator.pushReplacementNamed(context, Routes.onBoard);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorManager.primary,
        body: const Center(
          child: Image(
            image: AssetImage(ImageAssets.splashLogo),
          ),
        ),
      );
}

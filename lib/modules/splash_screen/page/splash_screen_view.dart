import 'dart:async';

import 'package:Eiger/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  bool _isVisibleLogo = false;
  bool _isVisibleLeftCloud = false;
  bool _isVisibleRightCloud = false;

  _SplashScreenViewState() {
    Timer(const Duration(milliseconds: 10), () {
      setState(() {
        _isVisibleRightCloud = true;
      });
    });
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _isVisibleLeftCloud = true;
      });
    });
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _isVisibleLogo = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientOrangePrimary,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/images/backgrounds/SplashScreenMountain.svg",
                fit: BoxFit.fitWidth,
              ),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: _isVisibleLogo ? 1.0 : 0,
                duration: const Duration(milliseconds: 3000),
                onEnd: () {
                  Navigator.pushReplacementNamed(context, routeOnBoarding);
                },
                child: SvgPicture.asset(
                  "assets/images/icons/Logo.svg",
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height / 3.5,
              right: 0,
              child: AnimatedOpacity(
                opacity: _isVisibleLeftCloud ? 1.0 : 0,
                duration: const Duration(milliseconds: 1000),
                child: SvgPicture.asset(
                  "assets/images/backgrounds/SplashScreenLeftCloud.svg",
                  color: Colors.white.withOpacity(0.8),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height / 5,
              left: 0,
              child: AnimatedOpacity(
                opacity: _isVisibleRightCloud ? 1.0 : 0,
                duration: const Duration(milliseconds: 2000),
                child: SvgPicture.asset(
                  "assets/images/backgrounds/SplashScreenRightCloud.svg",
                  color: Colors.white.withOpacity(0.8),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

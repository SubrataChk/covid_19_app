import 'dart:async';

import 'package:covid_19_app/src/app/app_image.dart';
import 'package:covid_19_app/src/view/home/world_state.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenSection extends StatefulWidget {
  const SplashScreenSection({super.key});

  @override
  State<SplashScreenSection> createState() => _SplashScreenSectionState();
}

class _SplashScreenSectionState extends State<SplashScreenSection>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => WorldStateSection()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: Center(
                child: Container(
                  height: 150.h,
                  width: 150.w,
                  child: Image.asset(AppImage.virus),
                ),
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              }),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Covid 19\n Tracker App ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20.sp),
          )
        ],
      )),
    );
  }
}

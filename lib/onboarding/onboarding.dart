import 'dart:async';

import 'package:flutter/material.dart';
import 'package:waveplus/constant/app_image.dart';
import 'package:waveplus/home.dart';

import 'controller/onboarding_controller.dart';
import 'widget/onboarding_widget.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    animate();
    super.initState();
  }

  animate() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == 2) {
        _pageController.jumpTo(0);
      } else {
        _pageController.nextPage(
            duration: Duration(microseconds: 100), curve: Curves.ease);
      }
    });
  }

  handleChange() {
    if (_pageController.page == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      _pageController.nextPage(
          duration: Duration(microseconds: 100), curve: Curves.ease);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImage.logo),
        centerTitle: false,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        child: PageView(
            controller: _pageController,
            children: OnboardingControl.onboardingModel
                .map((model) => OnboardingWidget(
                      onBoardingModel: model,
                      onPressed: handleChange,
                    ))
                .toList()),
      ),
    );
  }
}

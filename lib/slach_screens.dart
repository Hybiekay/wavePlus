import 'package:flutter/material.dart';
import 'package:waveplus/constant/app_image.dart';
import 'package:waveplus/onboarding/onboarding.dart';

class SlashWidget extends StatefulWidget {
  const SlashWidget({super.key});

  @override
  State<SlashWidget> createState() => _SlashWidgetState();
}

class _SlashWidgetState extends State<SlashWidget> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => OnBoarding()));
    });
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        child: Image.asset(
          AppImage.logo,
        ),
      ),
    );
  }
}

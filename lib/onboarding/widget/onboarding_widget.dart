import 'package:flutter/material.dart';
import 'package:waveplus/onboarding/model/onboarding.dart';

class OnboardingWidget extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  final VoidCallback onPressed;
  const OnboardingWidget({
    super.key,
    required this.onBoardingModel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: Image.asset(
                  height: MediaQuery.sizeOf(context).height * 0.30,
                  width: 300,
                  onBoardingModel.image)),
          SizedBox(
            height: 30,
          ),
          Text(
            onBoardingModel.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            onBoardingModel.subtitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                height: 64,
                width: 62,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 201, 250, 253).withOpacity(0.2),
                      Color(0xff14DBEB).withOpacity(0.1),
                      Color(0xff14DBEB),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 1, right: 1),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xff14DBEB),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:waveplus/constant/app_image.dart';
import 'package:waveplus/onboarding/model/onboarding.dart';

class OnboardingControl {
  static List<OnBoardingModel> onboardingModel = [
    OnBoardingModel(
        image: AppImage.Onboarding3,
        title: "Lightning-Fast \nTransactions",
        subtitle:
            """Say goodbye to waiting. Our platform ensures \nthat your balance is recharged in a blink, so you \ncan get back to what matters most without\nmissing a beat."""),
    OnBoardingModel(
        image: AppImage.Onboarding2,
        title: "Anytime, Anywhere \nAccessibility",
        subtitle:
            "Whether you're at home, at work, or on the go, waveplus is designed to be your constant companion. Our services are available 24/7, ensuring you have the flexibility to top up whenever you need it."),
    OnBoardingModel(
        image: AppImage.Onboarding,
        title: "Unparalleled Customer \nSupport",
        subtitle:
            """Have a question or need assistance? Our dedicated support team is here to help.
We take pride in delivering top-notch customer service, ensuring that your experience with WavePlus is nothing short of exceptional.""")
  ];
}

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              title: "Find Professional",
              body: "",
              image: Image.asset("assets/img_professional.svg")),
          PageViewModel(
              title: "Quality Service",
              body: "",
              image: Image.asset("assets/img_services.svg")),
          PageViewModel(
              title: "Payment Security",
              body: "",
              image: Image.asset("assets/img_secure_payment.svg")),
        ],
        onDone: () {
          print("Done is clicked");
          Navigator.pushNamed(context, '/login');
        },
        showNextButton: true,
        showSkipButton: true,
        skip: Text("Skip"),
        next: Icon(Icons.navigate_next),
        done: Text("Done"),
      ),
    );
  }
}

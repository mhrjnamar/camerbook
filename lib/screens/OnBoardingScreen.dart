import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              bodyWidget: Center(
                child: Text(
                  "Instantly connect with Professionals near you",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade500, shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]),
                ),
              ),
              image: Image.asset(
                "assets/img_professional.png",
                width: 50,
                height: 50,
              ),
              // footer: Text("this is foooter"),
              titleWidget: Text(
                "Find Professionals",
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              )),
          PageViewModel(
              title: "Services",
              bodyWidget: Center(
                child: Text(
                  "Get expert services from professionals",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade500, shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]),
                ),
              ),
              image: Image.asset("assets/services.png")),
          PageViewModel(
              title: "Secure Payment",
              bodyWidget: Center(
                child: Text(
                  "Secure payment to professionals",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade500, shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]),
                ),
              ),
              image: Image.asset("assets/secure_payment.png")),
        ],
        onDone: () {
          print("Done is clicked");

          Navigator.pushNamed(context, '/login');
        },
        showSkipButton: true,
        showNextButton: true,
        nextFlex: 1,
        dotsFlex: 2,
        skipFlex: 1,
        animationDuration: 200,
        curve: Curves.fastOutSlowIn,
        dotsDecorator: DotsDecorator(
            spacing: EdgeInsets.all(5),
            activeColor: Color(0xff20D5B2),
            // activeSize: Size.square(10),
            // size: Size.square(5),
            activeSize: Size(20, 10),
            size: Size.square(10),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        skip: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Color(0xff20D5B2),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: Offset(4, 4))
              ]),
          child: Center(
            child: Text(
              "Skip",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        next: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Color(0xff20D5B2), width: 2)),
          child: Center(
            child: Icon(
              Icons.navigate_next,
              size: 30,
              color: Color(0xff20D5B2),
            ),
          ),
        ),
        done: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Color(0xff20D5B2),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 40,
                    offset: Offset(4, 4))
              ]),
          child: Center(
            child: Text(
              "Done",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

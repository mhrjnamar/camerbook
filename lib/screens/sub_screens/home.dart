import 'package:camerbook/backend/Read.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:camerbook/screens/sub_screens/product.dart';

class HomeScr extends StatefulWidget {
  @override
  _HomeScrState createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {

  void productDisplay(var i) {
      String id = ReadUserId();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext addQuestionContext) {
      return Product(i,id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Top Category',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(12.0),
        child: CarouselSlider(
          options: CarouselOptions(height: 100.0, viewportFraction: 0.4),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                    onTap: () {
                      productDisplay('unnamed.png');
                    },
                    child: Column(
                      children: [
                        Container(
                            height: 80.0,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),

                            child:
                                Image(image: AssetImage('assets/unnamed.png'))),
                        Text(
                          'Item',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ));
              },
            );
          }).toList(),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Popular Gigs',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(12.0),
        child: CarouselSlider(
          options: CarouselOptions(height: 100.0, viewportFraction: 0.4),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                    onTap: () {
                      productDisplay('unnamed1.jpg');
                    },
                    child: Column(
                      children: [
                        Container(
                            height: 80.0,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),

                            child: Image(
                                image: AssetImage('assets/unnamed1.jpg'))),
                        Text(
                          'Item',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ));
              },
            );
          }).toList(),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Options',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(12.0),
        child: CarouselSlider(
          options: CarouselOptions(height: 100.0, viewportFraction: 0.4),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                    onTap: () {
                      productDisplay('unnamed.png');
                    },
                    child: Column(
                      children: [
                        Container(
                            height: 80.0,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),

                            child:
                                Image(image: AssetImage('assets/unnamed.png'))),
                        Text(
                          'Item',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ));
              },
            );
          }).toList(),
        ),
      ),
    ]);
  }
}

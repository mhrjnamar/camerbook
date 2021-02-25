import 'package:camerbook/backend/Read.dart';
import 'package:camerbook/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:camerbook/screens/sub_screens/product.dart';
import 'package:search_widget/search_widget.dart';

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
var list = ['amar', 'Aashish', 'Salil' ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.redAccent[200],
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
        child: Column(
          children: [
            SearchWidget(
                dataList: list,
                hideSearchBoxWhenItemSelected: false,
                listContainerHeight: MediaQuery.of(context).size.height / 4,
                textFieldBuilder: (TextEditingController controller, FocusNode focusNode) {
                  return TextField(

                  );
                },
                popupListItemBuilder: (item){
                  return PopupListItem(item);
                }
                ),

        ],
        )

      ),
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Top Category',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(20.0),
        child: CarouselSlider(
          options: CarouselOptions(height: 150.0, viewportFraction: 0.4),
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
                            decoration: sharedBoxDecoration,
                            height: 100.0,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),

                            child:
                                Image(image: AssetImage('assets/unnamed.png'))),
                        Text(
                          'Top Category',
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
        padding: EdgeInsets.all(20.0),
        child: CarouselSlider(
          options: CarouselOptions(height: 150.0, viewportFraction: 0.4),
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
                            decoration: sharedBoxDecoration,
                            height: 100.0,
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
        padding: EdgeInsets.all(20.0),
        child: CarouselSlider(
          options: CarouselOptions(height: 150.0, viewportFraction: 0.4),
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
                            decoration: sharedBoxDecoration,
                            height: 100.0,
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

class PopupListItem extends StatelessWidget {
  var item;

  PopupListItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(item),
    );
  }
}

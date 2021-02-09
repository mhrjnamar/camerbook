import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class Product extends StatefulWidget {
  var i;

  Product(var i) {
    this.i = i;
  }

  @override
  _ProductState createState() => _ProductState(i);
}

class _ProductState extends State<Product> {
  var i;

  _ProductState(var i) {
    this.i = i;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(i),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              SlimyCard(
                color: Colors.lightBlueAccent,
                width: 300,
                topCardHeight: 265,
                bottomCardHeight: 400,
                borderRadius: 25,
                topCardWidget: myWidget01(i),
                bottomCardWidget: myWidget02(),
                slimeEnabled: true,
              ),
            ],
          ),
        ));
  }
}

myWidget01(i) {
  return Container(
      child: Column(children: [
    Image(image: AssetImage('assets/' + i)),
    Text(
      "Product Name",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  ]));
}

myWidget02() {
  return Text(
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the"
    " industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and"
    " scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap "
    "into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the"
    " release of Letraset sheets containing Lorem Ipsum passages, and more recently with"
    " desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    style: TextStyle(
      fontSize: 18,
    ),
  );
}

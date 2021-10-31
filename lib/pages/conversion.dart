import 'package:flutter/material.dart';
import '../global.dart';
import './distance.dart';

class ConversionPage extends StatefulWidget {
  @override
  _ConversionPage createState() => _ConversionPage();
}

class _ConversionPage extends State<ConversionPage> {
  double res = totalDistance(distance1, distance2);
  String url1 = urlfirst;
  String url2 = urlsecond;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4C748B),
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DistancePage()));
              }),
          title: Text("Distance")),
      body: Center(
          child: Column(children: <Widget>[
        Text(
          '$res' + 'light years',
          style: TextStyle(fontSize: 20),
        ),
        Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
               width: 100,
          height: 100,
            child: Image.network(url1
        ),),
        Container(
           width: 100,
          height: 100,
        child: Image.network(url2
        ),)
          ]
         ))
      ])),
    );
  }
}

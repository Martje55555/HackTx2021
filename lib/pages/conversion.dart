import 'package:flutter/material.dart';
import '../global.dart';
import './login.dart';
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
              Navigator.pop(context);
            },
          ),
          actions: [
            TextButton(
              child: Text("Log Out", style: TextStyle(color: Colors.black)),
              onPressed: () {
                isWhat = false;
                empty = "";
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
          title: Text("Conversion Page")),
      body: 
      Container(
        decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/image/181105-light-year-al-1550.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
        child: Center(
          child: Column(children: <Widget>[
        Text(
          '$res' + ' light years',
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
    ));
  }
}

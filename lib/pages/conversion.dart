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
  String xd = url_sun;
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
      body: Center(
          child: Column(children: <Widget>[
        Text(
          '$res' + 'light years',
          style: TextStyle(fontSize: 20),
        ),
        Image.network(
          xd,
          color: Colors.transparent,
        ),
      ])),
    );
  }
}

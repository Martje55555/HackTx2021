import 'package:flutter/material.dart';
import '../global.dart';
import './login.dart';
import './distance.dart';

class ConversionPage extends StatefulWidget {
  @override
  _ConversionPage createState() => _ConversionPage();
}

class _ConversionPage extends State<ConversionPage> {
  double temp = totalDistance(distance1, distance2);

  //String res = temp.toStringAsPrecision(3);
  String url1 = urlfirst;
  String url2 = urlsecond;
  @override
  Widget build(BuildContext context) {
    String res = temp.toStringAsPrecision(3);  
    double speed = distanceinSpeedofLight(temp);
    String speedLight = speed.toStringAsPrecision(3);
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
            title: Text("Conversion Page")),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/image/181105-light-year-al-1550.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 45.0),
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '$dropDownValue  is '
                          '$res' +
                      ' Light Years away from $secdropDownValue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 100.0, top: 100.0),
                    padding: EdgeInsets.only(left: 15.0),
                    child: Image.network(url1),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    //margin: EdgeInsets.only(bottom: 200.0, top: 200.0),
                    //padding: EdgeInsets.only(left: 15.0),
                    child: Image.network(url2),
                  )
                ])),
                 Column(
                  children: [Text(
                    'It would take '
                          '$speedLight' +
                      ' minues to travel from $dropDownValue to $secdropDownValue at the speed of light',
                      textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  )]
          )])),
        ));
  }
}

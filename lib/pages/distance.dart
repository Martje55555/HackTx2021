import 'package:flutter/material.dart';
import '../global.dart';
import './problems.dart';
import './conversion.dart';
import './login.dart';

class DistancePage extends StatefulWidget {
  @override
  _DistancePage createState() => _DistancePage();
}

class _DistancePage extends State<DistancePage> {
  navigateToConversionPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConversionPage()));
  }

  navigateToProblems() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Problems()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text("Distance From Two Objects")),
      backgroundColor: Color(0xff4C748B),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/image/istockphoto-1267065396-170667a.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "lib/image/istockphoto-1267065396-170667a.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 45.0, top: 45.0),
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text("Distance in Light Years",
                      style: TextStyle(
                          fontFamily: "Norwester",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Color(0xffFFFFFF)))),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    value: dropDownValue,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropDownValue = newvalue!;
                      });
                    },
                    items: <String>[
                      'Select',
                      'Sun',
                      'Mercury',
                      'Venus',
                      'Earth',
                      'Mars',
                      'Jupiter',
                      'Saturn',
                      'Uranus',
                      'Neptune'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    // hint: Text('Dropdown'),
                  ),
                  DropdownButton<String>(
                      value: secdropDownValue,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Select',
                        'Sun',
                        'Mercury',
                        'Venus',
                        'Earth',
                        'Mars',
                        'Jupiter',
                        'Saturn',
                        'Uranus',
                        'Neptune'
                      ].map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          );
                        },
                      ).toList(),
                      hint: Text('Dropdown'),
                      onChanged: (value) {
                        setState(() {
                          secdropDownValue = value!;
                        });
                      }),
                ],
              )),
              Column(children: [
                ElevatedButton(
                    child: Text(
                      "Continue",
                    ),
                    onPressed: (dropDownValue != "Select" &&
                                secdropDownValue != "Select") ==
                            true
                        ? () {
                            setState(() {
                              if (dropDownValue == "Sun") {
                                distance1 = 0.0;
                                urlfirst = url_sun;
                              }
                              if (dropDownValue == "Mercury") {
                                distance1 = SuntoMercury;
                                urlfirst = url_mercury;
                              }
                              if (dropDownValue == "Venus") {
                                distance1 = SuntoVenus;
                                urlfirst = url_venus;
                              }
                              if (dropDownValue == "Earth") {
                                distance1 = SuntoEarth;
                                urlfirst = url_earth;
                              }
                              if (dropDownValue == "Mars") {
                                distance1 = SuntoMars;
                                urlfirst = url_mars;
                              }
                              if (dropDownValue == "Jupiter") {
                                distance1 = SuntoJupiter;
                                urlfirst = url_jupiter;
                              }
                              if (dropDownValue == "Saturn") {
                                distance1 = SuntoSaturn;
                                urlfirst = url_saturn;
                              }
                              if (dropDownValue == "Uranus") {
                                distance1 = SuntoUranus;
                                urlfirst = url_uranus;
                              }
                              if (dropDownValue == "Neptune") {
                                distance1 = SuntoNeptune;
                                urlfirst = url_neptune;
                              }
                              if (secdropDownValue == "Sun") {
                                distance2 = 0.0;
                                urlsecond = url_sun;
                              }
                              if (secdropDownValue == "Mercury") {
                                distance2 = SuntoMercury;
                                urlsecond = url_mercury;
                              }
                              if (secdropDownValue == "Venus") {
                                distance2 = SuntoVenus;
                                urlsecond = url_venus;
                              }
                              if (secdropDownValue == "Earth") {
                                distance2 = SuntoEarth;
                                urlsecond = url_earth;
                              }
                              if (secdropDownValue == "Mars") {
                                distance2 = SuntoMars;
                                urlsecond = url_mars;
                              }
                              if (secdropDownValue == "Jupiter") {
                                distance2 = SuntoJupiter;
                                urlsecond = url_jupiter;
                              }
                              if (secdropDownValue == "Saturn") {
                                distance2 = SuntoSaturn;
                                urlsecond = url_saturn;
                              }
                              if (secdropDownValue == "Uranus") {
                                distance2 = SuntoUranus;
                                urlsecond = url_uranus;
                              }
                              if (secdropDownValue == "Neptune") {
                                distance2 = SuntoNeptune;
                                urlsecond = url_neptune;
                              }
                            });

                            //navigateToConversionPage();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConversionPage()));
                          }
                        : null),
              ])
            ],
          ))),
    );
  }
}

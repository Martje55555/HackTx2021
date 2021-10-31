import 'package:flutter/material.dart';
import '../global.dart';
import './problems.dart';
import 'conversion.dart';

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
                navigateToProblems();
              },
            ),
            title: Text("Distance From Two Objects")),
        backgroundColor: Color(0xff4C748B),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Distance in Light Years",
                style: TextStyle(
                    fontFamily: "Norwester",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color(0xffFFFFFF))),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: dropDownValue,
                  style: TextStyle(color: Colors.black),
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
                          child: Text(value),
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
                            }
                            if (dropDownValue == "Mercury") {
                              distance1 = SuntoMercury;
                            }
                            if (dropDownValue == "Venus") {
                              distance1 = SuntoVenus;
                            }
                            if (dropDownValue == "Earth") {
                              distance1 = SuntoEarth;
                            }
                            if (dropDownValue == "Mars") {
                              distance1 = SuntoMars;
                            }
                            if (dropDownValue == "Jupiter") {
                              distance1 = SuntoJupiter;
                            }
                            if (dropDownValue == "Saturn") {
                              distance1 = SuntoSaturn;
                            }
                            if (dropDownValue == "Uranus") {
                              distance1 = SuntoUranus;
                            }
                            if (dropDownValue == "Neptune") {
                              distance1 = SuntoNeptune;
                            }
                            if (secdropDownValue == "Sun") {
                              distance2 = 0.0;
                            }
                            if (secdropDownValue == "Mercury") {
                              distance2 = SuntoMercury;
                            }
                            if (secdropDownValue == "Venus") {
                              distance2 = SuntoVenus;
                            }
                            if (secdropDownValue == "Earth") {
                              distance2 = SuntoEarth;
                            }
                            if (secdropDownValue == "Mars") {
                              distance2 = SuntoMars;
                            }
                            if (secdropDownValue == "Jupiter") {
                              distance2 = SuntoJupiter;
                            }
                            if (secdropDownValue == "Saturn") {
                              distance2 = SuntoSaturn;
                            }
                            if (secdropDownValue == "Uranus") {
                              distance2 = SuntoUranus;
                            }
                            if (secdropDownValue == "Neptune") {
                              distance2 = SuntoNeptune;
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
        )));
  }
}

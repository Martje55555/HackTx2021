import 'package:flutter/material.dart';
import 'global.dart';
import 'problems.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () {
                    //navigateToConversionPage();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConversionPage()));
                  }),
            ])
          ],
        )));
  }
}

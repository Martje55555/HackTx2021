import 'package:flutter/material.dart';
import 'package:hack_tx_2021/global.dart';

class DistancePage extends StatefulWidget{
  @override
  _DistancePage createState() => _DistancePage();
}

class _DistancePage extends State<DistancePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff4C748B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Distance in Light Years",
              style: TextStyle(
              fontFamily: "Norwester",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Color(0xffFFFFFF))
          ),
          Container(
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
              DropdownButton<String>(
                value: dropDownValue,
                style: TextStyle(color: Colors.black),
                items: <String>['Sun', 'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'].map<DropdownMenuItem<String>>(
                  (String value){
                  return DropdownMenuItem<String>(
                     value: value,
                     child: Text(value),
                  );
                }).toList(),
                hint: Text('Dropdown'),
                onChanged: ( value){
                  setState(() {
                    dropDownValue = value;
                  });
                }
                ),
                DropdownButton<String>(
               value: secdropDownValue,
                items: <String>['Sun', 'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'].map<DropdownMenuItem<String>>(
                  (String value){
                  return DropdownMenuItem<String>(
                     value: value,
                     child: Text(value),
                  );
                },).toList(),
                hint: Text('Dropdown'),
                onChanged: (value){
                  setState(() {
                    secdropDownValue = value;
                  });
                }
                ),  
              ],
            )
          ),
        ],
      )
     )
   );
  }
}
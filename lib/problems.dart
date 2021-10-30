import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Problems extends StatefulWidget {
  @override
  _Problems createState() => _Problems();
}

class _Problems extends State<Problems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Problems',
              style: TextStyle(fontSize: 32),
            ),
            Container(
                height: 48,
                width: 200,
                margin: EdgeInsets.only(bottom: 250.0, top: 250.0),
                padding: EdgeInsets.only(left: 15.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Distances',
                    style: TextStyle(fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

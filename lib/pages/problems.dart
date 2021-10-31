import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './distance.dart';
import './login.dart';

import '../global.dart' as globals;

class Problems extends StatefulWidget {
  @override
  _Problems createState() => _Problems();
}

class _Problems extends State<Problems> {
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
                globals.isWhat = false;
                globals.empty = "";
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
          title: Text("Problems Page")),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DistancePage()));
                  },
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

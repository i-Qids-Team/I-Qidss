import 'package:flutter/material.dart';

import 'vegetable_screen.dart';

class VegetablePage extends StatefulWidget {
  @override
  _VegetablePageState createState() => _VegetablePageState();
}

class _VegetablePageState extends State<VegetablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetables'),
        backgroundColor: Colors.redAccent[100],
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/ready.gif"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 255.0),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.red[50],
                textColor: Colors.red,
                padding: const EdgeInsets.all(15.0),
                child: Text("Lets",
                    style: TextStyle(fontSize: 25, letterSpacing: 3)),
                onPressed: () {
                  // Navigator.pushNamed(context, '/vegetable_screen');
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new VegetableScreen()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.red[100], width: 5.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

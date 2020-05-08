import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iqidss/shape/Model/MockData.dart';


class GamePage extends StatefulWidget {
  @override
  _GamePage createState() => _GamePage();
}

class _GamePage extends State<GamePage> with TickerProviderStateMixin {
  MockData mockData = MockData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Corona, play Shape!'),
          backgroundColor: Colors.red[300],
          actions: <Widget>[
          ]),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: double.infinity,
        color: Colors.red[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  mockData.getQuestion().toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Image.asset(mockData.getImage()),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: new RaisedButton(
                child: const Text('True', style: TextStyle(fontSize: 18)),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: new RaisedButton(
                child: const Text('False', style: TextStyle(fontSize: 18)),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

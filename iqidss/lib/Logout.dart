import 'package:flutter/material.dart';
import 'package:iqidss/login_screen.dart';

class Logout extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Logout Session'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Container(
            color: Colors.red[100],
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Text("You have successfully logged out",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                Image.asset(
                  'assets/main.gif',
                  alignment: Alignment.center,
                  height: 210,
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.yellow[600],
                    textColor: Colors.black,
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Login", style: TextStyle(fontSize: 25)),
                    onPressed: () {
                      return Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
              ],
            )));
  }
}
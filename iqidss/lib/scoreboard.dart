import 'package:flutter/material.dart';

class ScoreBoard extends StatefulWidget {
  @override
  _ScoreBoard createState() => _ScoreBoard();
}

class _ScoreBoard extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScoreBoard!'),
          backgroundColor: Colors.red[300],
        ),
        body: new Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "\nShape",
                  style: TextStyle(fontSize: 25.0, color: Colors.black87),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.pink[100],
                  child: Text(
                    "24",
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "\nAnimal",
                  style: TextStyle(fontSize: 25.0, color: Colors.black87),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.green[100],
                  child: Text(
                    "50",
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "\nColours",
                  style: TextStyle(fontSize: 25.0, color: Colors.black87),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.purple[100],
                  child: Text(
                    "40",
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "\nVegetables",
                  style: TextStyle(fontSize: 25.0, color: Colors.black87),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          
          decoration: BoxDecoration(
            color: Colors.pink[50],
            image: DecorationImage(
              image: AssetImage("assets/main.gif"),
              alignment: Alignment.bottomCenter
            ),
          ),
        ));
  }
}
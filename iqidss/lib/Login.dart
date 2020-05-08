import 'package:flutter/material.dart';

import 'mainpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String value;

  @override
  Widget build(BuildContext context) {

    TextEditingController usernameController = TextEditingController();
    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/bg.png',
            fit: BoxFit.cover,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Image.asset(
                "assets/logo.gif",
                height: 250.0,
                width: 250.0,
                ),
              ),
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                    height: 230.0,
                    width: 380.0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 25.0
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow[50],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                          ),
                          child: TextField(
                            controller: usernameController,
                          autocorrect: false,
                          autofocus: false,
                          onChanged: (text){
                            value = text;
                          },
                          style: TextStyle(
                            fontSize: 18.0,
                          
                          ),
                          decoration: InputDecoration(
                            hintText: "Username",
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[300],
                            contentPadding: EdgeInsets.all(15.0),
                          ),
                        ),
                        ),
                        MaterialButton(
                          onPressed: (){
                            if(usernameController.text.isNotEmpty)
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage(value)));
                            }
                            else
                            {
                              _showAlertDialog();
                            }
                          },
                          minWidth: 250.0,
                          splashColor: Colors.red[800],
                          color: Colors.red,
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

   void _showAlertDialog()
  {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context)
          {
              return AlertDialog(
                title: new Text('ALERT!'),
                content: new Text('Please enter your username'),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: new Text('try Again?')
                  )
                ],
              );
          }
      );
  }
}
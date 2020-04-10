import 'package:flutter/material.dart';
import 'package:iqidss/home_screen.dart';
import 'package:iqidss/mainpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    final usernameController = TextEditingController();

    final logo = Hero(
      tag: 'logo',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/logo.gif', height: 180,),
      ),
    );

    final txtUserName = TextField(
      controller: usernameController,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
      )
    );

    final btnLogin = RaisedButton(
      child: Text('Login'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {
        if(usernameController != null && usernameController.text == "abc")
          {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Main()));
          }
        else
          {
                _showAlertDialog();
          }
      },
    );

    return new Scaffold(
      body: new Center(
        child: new Container( alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/background1.jpg"
                  ), 
                  fit: BoxFit.fill,
                ),
              ),
              
        child: new ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 25,right: 25),
          children: <Widget>[
            logo,
            SizedBox(height: 20.0,),
            txtUserName,
            SizedBox(height: 8.0,),
            btnLogin,
    
          ],
        ),
      )),
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
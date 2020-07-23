import 'package:flutter/material.dart';
import 'package:iqidss/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account'),
      ),
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
                        height: 250.0,
                        width: 380.0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.yellow[50],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: TextFormField(
                                  validator: (input) => input.isEmpty
                                      ? 'Please provide an email'
                                      : null,
                                  onSaved: (input) => _email = input,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[300],
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: TextFormField(
                                  validator: (input) => input.isEmpty
                                      ? 'Please insert password at least 6 characters'
                                      : null,
                                  onSaved: (input) => _password = input,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[300],
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              MaterialButton(
                                onPressed: signUp,
                                minWidth: 250.0,
                                splashColor: Colors.red[800],
                                color: Colors.red,
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}

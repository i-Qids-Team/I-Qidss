import 'package:flutter/material.dart';
import 'package:iqidss/signup.dart';
import 'mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
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
              showAlert(),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Image.asset(
                  "assets/logo.gif",
                  height: 180.0,
                  width: 230.0,
                ),
              ),
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                        height: 300.0,
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
                                  vertical: 3.0,
                                ),
                                child: TextFormField(
                                  validator: (input) => input.isEmpty
                                      ? 'Email cannot be blank'
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
                                  vertical: 3.0,
                                ),
                                child: TextFormField(
                                  validator: (input) => input.isEmpty
                                      ? 'Please insert your password'
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
                                onPressed: login,
                                minWidth: 250.0,
                                splashColor: Colors.red[800],
                                color: Colors.red,
                                padding: EdgeInsets.symmetric(
                                  vertical: 3.0,
                                ),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new SignUpPage()),
                                  );
                                },
                                minWidth: 250.0,
                                splashColor: Colors.red[800],
                                color: Colors.red,
                                padding: EdgeInsets.symmetric(
                                  vertical: 3.0,
                                ),
                                child: Text(
                                  "Create Account",
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

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _error,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  Future<void> login() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainPage(user: user)));
      } catch (e) {
        print(e);
        setState(() {
          _error = e.message;
        });
      }
    }
  }
}

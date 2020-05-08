import 'package:flutter/material.dart';
import 'package:iqidss/UserProfile.dart';
import 'package:iqidss/NotificationBar.dart';
import 'package:iqidss/Logout.dart';
import 'package:iqidss/animal/screen/animalsplashscreen.dart';

import 'vegetables/screen/VegetableHome.dart';

class MainPage extends StatefulWidget {
 final String name;
  MainPage(this.name);


  @override
  _MainPageState createState() => _MainPageState(name);
}

class _MainPageState extends State<MainPage> {
  String value;
  _MainPageState(this.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ' + value + "!"),
        backgroundColor: Colors.red[300],
      ),
      drawer: _Drawer(),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/main.gif',
              height: 190,
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue[300],
                textColor: Colors.white,
                padding: const EdgeInsets.all(15.0),
                child: Text("Body Part", style: TextStyle(fontSize: 25)),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.purple[200],
                textColor: Colors.white,
                padding: const EdgeInsets.all(15.0),
                child: Text("Animal", style: TextStyle(fontSize: 25)),
                onPressed: () {
                   Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return AnimalSplashScreen(widget.name);
                  }));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.lightGreen[200],
                textColor: Colors.white,
                padding: const EdgeInsets.all(15.0),
                child: Text("Color", style: TextStyle(fontSize: 25)),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.redAccent[100],
                textColor: Colors.white,
                padding: const EdgeInsets.all(15.0),
                child: Text("Vegetables", style: TextStyle(fontSize: 25)),
                onPressed: () {
                  
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTitle extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  ListTitle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.red.shade300)),
        ),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Drawer extends StatefulWidget {
  @override
  __DrawerState createState() => __DrawerState();
}

class __DrawerState extends State<_Drawer> {
//Switch
  bool _value = false;

  void _onChanged(bool value) {
    setState(() {
      _value = value;
    });
  } //endSwitch

//fontSize
  // String fontSize = "";
  var _fontsize = ['2', '4', '6', '8', '10', '12'];
  var _currentFontSelected = '10';
  //end FontSize

//alert for Change Username
  TextEditingController customeController = new TextEditingController();

  Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Username'),
            content: TextField(
              controller: customeController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Save'),
                onPressed: () {
                  Navigator.of(context).pop(customeController.text.toString());
                },
              ),
              MaterialButton(
                elevation: 5.0,
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  //end alert Change username

//createAboutDialog
  createAboutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('About i-Qids'),
            content: Text(
                'The aim of the proposed solution is to provide the user an attractive and effective training digital module implements gamification element that is suitable for 4-7 years old children to enhance the Visual, Audio, Reading and Kinesthetic (VARK) skills at the young age. Further info can be found in the game section.',
                style: TextStyle(fontSize: 12)),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
  //end CreateAboutDialog

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Image(
              alignment: Alignment.center,
              fit: BoxFit.contain,
              image: AssetImage('assets/main.gif'),
            ),
          ),
          Card(
              child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.red.shade600)),
                  ),
                  child: InkWell(
                    splashColor: Colors.orangeAccent,
                    child: Container(
                      height: 60,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Profile'),
                        onTap: () {
                          return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfile()),
                          );
                        },
                      ),
                    ),
                  ))),
          Card(
              child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.red.shade600)),
                  ),
                  child: InkWell(
                    splashColor: Colors.orangeAccent,
                    child: Container(
                      height: 60,
                      child: ListTile(
                        leading: Icon(Icons.notifications),
                        title: Text('Notification'),
                        onTap: () {
                          return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationBar()),
                          );
                        },
                      ),
                    ),
                  ))),
          Card(
              child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.red.shade600)),
                  ),
                  child: InkWell(
                    splashColor: Colors.orangeAccent,
                    child: Container(
                      height: 60,
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Setting'),
                        onTap: () {
                          _settingBottomSheet(context);
                        },
                      ),
                    ),
                  ))),
          Card(
              child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.red.shade600)),
                  ),
                  child: InkWell(
                    splashColor: Colors.orangeAccent,
                    child: Container(
                      height: 60,
                      child: ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Logout'),
                        onTap: () {
                          return Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogoutPage()),
                          );
                        },
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }

  //function _settingBottomSheet
  void _settingBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              // margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
              color: Color(0xFF737373),
              child: Container(
                decoration: BoxDecoration(
                    // color: Theme.of(context).canvasColor,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30),
                      topRight: const Radius.circular(30),
                    )),
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("SETTING PAGE",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.orangeAccent,
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ), //Row

                      Row(
                        children: <Widget>[
                          Text(
                            "Sound Mute",
                            style: TextStyle(color: Colors.black),
                          ),
                          Spacer(),
                          new Switch(
                              activeColor: Colors.green,
                              value: _value,
                              onChanged: (bool value) {
                                _onChanged(value);
                              }),
                        ],
                      ), //Row

                      Row(children: <Widget>[
                        Text("Font Size"),
                        Spacer(),
                        DropdownButton<String>(
                          items: _fontsize.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String newValueSelected) {
                            setState(() {
                              this._currentFontSelected = newValueSelected;
                            });
                          },
                          value: _currentFontSelected,
                        ),
                      ]), //Row

                      Row(
                        children: <Widget>[
                          Text("Change Username"),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orangeAccent,
                              size: 25,
                            ),
                            onPressed: () {
                              createAlertDialog(context).then((onValue) {
                                SnackBar mySnackbar = SnackBar(
                                    content:
                                        Text('Sucessfully change username'));
                                Scaffold.of(context).showSnackBar(mySnackbar);
                              });
                            },
                          )
                        ],
                      ), //Row

                      Row(
                        children: <Widget>[
                          Text("About i-Qids"),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.info,
                              color: Colors.orangeAccent,
                              size: 25,
                            ),
                            onPressed: () {
                              // createAlertDialog(context).then((onValue) {});
                              createAboutDialog(context);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}


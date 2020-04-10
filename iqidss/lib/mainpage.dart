import 'package:flutter/material.dart';

class Main extends StatelessWidget {
void _doNothing(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
                      border: Border(
                          bottom: BorderSide(color: Colors.red.shade600)),
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
                                  builder: (context) => Notification()),
                            );
                          },
                        ),
                      ),
                    ))),
            Card(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.red.shade600)),
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
                                  builder: (context) => Notification()),
                            );
                          },
                        ),
                      ),
                    ))),
            Card(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.red.shade600)),
                    ),
                    child: InkWell(
                      splashColor: Colors.orangeAccent,
                      child: Container(
                        height: 60,
                        child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Setting'),
                          onTap: () {
                            return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notification()),
                            );
                          },
                        ),
                      ),
                    ))),
            Card(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.red.shade600)),
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
                              MaterialPageRoute(builder: (context) => Notification()),
                            );
                          },
                        ),
                      ),
                    ))),
          ],
        ),
        ),  
      appBar: AppBar(   
        leading: IconButton(icon: Icon(Icons.settings), onPressed: _doNothing),   
        title: Text('Welcome Corona!'),      
        backgroundColor: Colors.brown[100],
        actions: <Widget> [          
        ]
        ), 
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
              Text("Score: 0", style: TextStyle(fontSize: 20, color: Colors.white)),
              Image.asset(
                'assets/main.gif',
                height: 190,
              ),
              SizedBox(height: 20.0),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue[300],
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Body Part", style: TextStyle(fontSize: 25)),
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.purple[200],
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Animal", style: TextStyle(fontSize: 25)),
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.lightGreen[200],
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Color", style: TextStyle(fontSize: 25)),
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.redAccent[100],
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Sport", style: TextStyle(fontSize: 25)),
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                  ),
                ),
            ],),
        ),
    );
  }
}

class ListTitle extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;

  ListTitle(this.icon,this.text,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
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
                      ),)
                      )
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

class Notification extends StatelessWidget {
  final items = List<String>.generate(5, (i) => "Message ${i + 1}");

  Function setState;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Messages"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              Icon(Icons.delete);
              return Dismissible(
                key: Key(item),
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
                  });
                  //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Message deleted")));
                },
                background: Container(
                  child: Center(
                    child: Text(
                      'Deleted',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Colors.red,
                ),
                child: Card(
                  color: const Color(0xFFFCE4EC),
                  child: ListTile(
                    leading: Icon(Icons.notifications_active),
                    title: Text('$item'),
                    subtitle: Text('Collect more score to beat others. '
                        '20/3/2020'),
                    isThreeLine: true,
                    // trailing: Icon(Icons.swap_horizontal_circle),
                  ),
                ),
              );
            }));
  } // itemBuilder
}
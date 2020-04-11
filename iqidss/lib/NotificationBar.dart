import 'package:flutter/material.dart';

class NotificationBar extends StatelessWidget {
  
  final items = List<String>.generate(5, (i) => "Message ${i + 1}");

  Function setState;
  @override
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
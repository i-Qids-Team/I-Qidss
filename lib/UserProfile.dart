import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor:  Colors.orangeAccent,
        ),
        body: Container(   
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[   
                Text("Welcome!",
                    style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold)), 
                     SizedBox(height: 20.0),            
                Container(   
                  height: 210, 
                 decoration: BoxDecoration( 
                   color: Colors.white,
                       border: Border.all(
                       color: Colors.white,width: 10,
                     ),
                     borderRadius: BorderRadius.all(Radius.circular(200),),
                 ),
                 child: Image.asset(
                 'assets/main.gif',  
                 fit: BoxFit.contain,        
            ),
                ),
                 SizedBox(height: 20.0),
                 Container(
                   height: 80,
                   width: double.infinity,                   
                   padding: const EdgeInsets.all(15.0),  
                  decoration: BoxDecoration( 
                   color: Colors.white,                   
                       border: Border.all(
                       color: Colors.white,width: 10,                       
                     ),                                          
                     borderRadius: BorderRadius.all(Radius.circular(200),),
                 ),               
                   child:Center(
                     child:
                     Text("Name: Corona",               
                    style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    ),
                   ),                   
                 ), 
                 SizedBox(height: 10.0),
                 Container(
                   height: 80,
                   width: double.infinity,                   
                   padding: const EdgeInsets.all(15.0),  
                  decoration: BoxDecoration( 
                   color: Colors.white,                   
                       border: Border.all(
                       color: Colors.white,width: 10,                       
                     ),                                          
                     borderRadius: BorderRadius.all(Radius.circular(200),),
                 ),               
                   child:Center(
                     child:
                     Text("Score:  0",               
                    style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    ),
                   ),                   
                 ),                                    
              ],
            )));
  }
}
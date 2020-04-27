
import 'package:flutter/material.dart';

import 'package:ialu_app/screens/home_screen.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
       home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
        appBar: AppBar(
          title: Text('IALU Home'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('LS Talks'),
            onPressed: () {
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
          ),
        ),
      );
  }
}


/*
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return new Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        ),
    );
  }
}
*/


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Salle Talks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}



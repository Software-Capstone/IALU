
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Main Menu'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('LS Talks'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: (){
                  Navigator.pop(context);
                }
              ),
            ],
          )
        )
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



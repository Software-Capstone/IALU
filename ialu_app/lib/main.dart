
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
                title: Text('Universities'),
                subtitle: Text('Menus'),
                onTap: (){
                  Navigator.pop(context);
                }
              ),
              ListTile(
                title: Text('Lasalle Talks'),
                subtitle: Text('VideosGrid'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Newsfeed'),
                subtitle: Text('RSS'),
                onTap: (){
                  Navigator.pop(context);
                }
              ),
              ListTile(
                title: Text('DLS Footsteps'),
                subtitle: Text('URL'),
                onTap: (){
                  _launchURL('https://www.dlsfootsteps.org');
                }
              ),
              ListTile(
                title: Text('Resource Center'),
                subtitle: Text('URL'),
                onTap: (){
                  _launchURL('https://www.lasallianresources.org');
                }
              ),
              ListTile(
                title: Text('IALU Webpage'),
                subtitle: Text('URL'),
                onTap: (){
                  _launchURL('http://www.ialu.org');
                }
              ),
              /* ListTile(
                title: Text('Schedule'),
                subtitle: Text('Events'),
                onTap: (){
                  Navigator.pop(context);
                }
              ), */
              ListTile(
                title: Text('Research'),
                subtitle: Text('URL'),
                onTap: (){
                  _launchURL('http://rr.Bethlehem.edu/index.php/itemlist/category/24-general');
                }
              ),
              ListTile(
                title: Text('Journal'),
                subtitle: Text('URL'),
                onTap: (){
                  _launchURL('https://axis.smumn.edu');
                }
              ),
              ListTile(
                title: Text('Symposium'),
                subtitle: Text('URL'),
                onTap: (){
                  _launchURL('https://www.smumn.edu/about/institutes-affiliates/institute-for-lasallian-studies/international-symposium-on-lasallian-research ');
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

_launchURL(url) async {
  url = url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

/*
class DLSScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DLS Footsteps',
      debugShowCheckedModeBanner: false,
      home: DLS_FootstepsScreen(),
    );
  }
}
*/


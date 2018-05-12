import 'package:flutter/material.dart';
import 'package:app/main.dart';

class Settings extends StatelessWidget{

  String text =  "settings page";
  Settings(String text){
    this.text = text;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Settings'),
          actions: <Widget>[
            new IconButton(icon: new Icon( Icons.home), onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  new MaterialPageRoute( builder: (BuildContext context)  => new MyHomePage() ),
                  ModalRoute.withName('/Home'));
            }),
            new IconButton(icon: new Icon( Icons.exit_to_app), onPressed: () {Navigator.pushNamed(context,'/Login');}),
//
          ],
        ),

        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(
                    children: <Widget>[
                      new Text(text),
//
                    ]
                )
            )
        )
    );
  }
}
import 'package:flutter/material.dart';

class hello extends StatelessWidget{
  String text ;

  hello(String text){
    this.text = text;
  }
  Widget build(BuildContext context){
    return new Container(

        padding: const EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(text),
              new Text(text),
              new Text(text),
            ],
          ),
        )
    );
  }
}
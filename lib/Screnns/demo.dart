import 'package:flutter/material.dart';
import 'package:app/main.dart';

class Demo extends StatefulWidget{
  @override
  _Demo createState() => new _Demo();
}

class _Demo extends State<Demo>{

  bool _switchVal = false;

  switchOnClick(bool val){
    setState(() {  // this method should be implemented in stateful widget
      _switchVal = val;
    });
  }
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Demo page'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: () { // sample navigation component
              Navigator.pushNamed(context, '/Login');
            }),
          ],
        ),
        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(
                    children: <Widget>[
                      new SwitchListTile( // sample component
                          value: _switchVal,
                          title: new Text('switch'),
                          onChanged: (bool val){switchOnClick(val);}
                      ),
                    ]
                )
            )
        )
    );
  }
}

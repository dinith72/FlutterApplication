import 'package:flutter/material.dart';
import 'package:app/main.dart';
import 'dart:async';

class Demo extends StatefulWidget{
  @override
  _Demo createState() => new _Demo();
}

class _Demo extends State<Demo>{
  DateTime _date = new DateTime.now();
  bool _switchVal = false;

  switchOnClick(bool val){
    setState(() {  // this method should be implemented in stateful widget
      _switchVal = val;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: _date,
          firstDate: new DateTime(2015),
          lastDate: new DateTime(2025)
      );
      if(picked != null && picked != _date){
        print('date selected' + picked.toString());
        setState(() {
          _date = picked;
        });
      }
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
                      new RaisedButton(
                          child: new Text('select date'),
                          onPressed: (){_selectDate(context);}
                          ),
                      new Text (_date.toString()),
                    ]
                )
            )
        )
    );
  }
}

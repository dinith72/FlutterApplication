import 'package:flutter/material.dart';
import 'package:app/main.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';
import 'dart:async';

class Testdb extends StatefulWidget{
  @override
  _Testdb createState() => new _Testdb();
}

class _Testdb extends State<Testdb>{

  bool _switchVal = false;
  var pool;

  switchOnClick(bool val){
    setState(() {  // this method should be implemented in stateful widget
      _switchVal = val;
    });
  }

  static void getInfo() async {
    var pool = new ConnectionPool(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'mysql',
        db: 'startupdocterdb',
        max: 5);
    var results = await pool.query('SELECT member.`first name`  FROM startupdocterdb.member;');
    results.forEach((row){
      print(row[0]);
    });
  }
  @override
  void initState() {
    getInfo();
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
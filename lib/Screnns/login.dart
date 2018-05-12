import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class Login extends StatelessWidget{


  static final TextEditingController _user  = new TextEditingController();
  static final TextEditingController _pw = new TextEditingController();
  final snackbar = new SnackBar(content: new Text( 'hikzzz.....a snack bar'));

  String getUserName () => _user.text;
  String getPassword () => _pw.text;
  String username = "";

//   _onChanged(String val){
//    setState(){
//      username = val;
//    }
//  }
//
//  void _snakBar(String val){
//    if(val.isEmpty)
//      return;
//    else {
//
//    }
//  }



  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextField(
                      controller: _user,
                      decoration: new InputDecoration(hintText: 'enter username'),

                    ),

                    new TextField( controller: _pw,decoration: new InputDecoration(hintText: 'enter password'), obscureText: true),
                    new RaisedButton(onPressed: (){
                      var alert;

                      if(_user.text == 'dj' && _pw.text == 'dj') {
                        Navigator.pushNamed(context, '/Home');
                      }else {
                      alert = new AlertDialog(content: new Text('could not log in'), title: new Text('sign in error'),);
                        Navigator.pushNamed(context, '/Login');
                      }
                      if(alert != null) {
                        showDialog(context: context, child: alert);
                      }
                    } ,
                      child: new Text('submit'),)
                  ],

                )
            )
        )

    );
  }
}




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

  _onChanged(String value){
    print(value);
  }



  Widget build(BuildContext context) {
    bool _married = true;
    return new Scaffold(
        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextField(
                      controller: _user, // the text entered is saved here
                      decoration: new InputDecoration(hintText: 'enter username' , labelText : 'username',), // decorations to the text field
                      onChanged: (String value){_onChanged(value);} , // action to be triggered when text is changed : text is entered
                      autocorrect: true, // correct your inputs

                    ),

                    new TextField( controller: _pw,decoration: new InputDecoration(hintText: 'enter password'), obscureText: true),

                    new RaisedButton(onPressed: (){
                      var alert;

                      if(_user.text == 'dj' && _pw.text == 'dj') {
                        Navigator.pushNamed(context, '/Home');
                      }else {
                        alert = new AlertDialog( // creating the alert dialog
                            content: new Column( // setting the content
                              children: <Widget>[

                                new Text('incorrect password'), // text
                                new RaisedButton(onPressed:(){Navigator.pop(context);}  , child: new Text('Ok'),), // on click button to close when it is pressed
                              ],
                            ),

                            title: new Icon(Icons.warning) // title of the alert button is set an icon
                        );
                        Navigator.pushNamed(context, '/Login');
                      }
                      if(alert != null) {
                        showDialog(context: context, child: alert); // code to display the alert button
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




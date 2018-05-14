import 'package:flutter/material.dart';
import 'package:app/Screnns/login.dart';
import 'package:app/Screnns/Settings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),

      routes: <String,WidgetBuilder>{
        '/Login' : (BuildContext context) => new Login(),
        '/Settings' : (BuildContext context) => new Settings("Settings page"),
        '/Home' : (BuildContext context) => new MyHomePage()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _married = true;
  void ismarried(bool stat){
    setState(() {
      _married = stat;
    });
  }
  @override
  Widget build(BuildContext context) {

    final ValueChanged<bool> onChanged = null;

    return new Scaffold(
        appBar: new AppBar(

          title: new Text("Home"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.settings), onPressed: () {
              Navigator.pushNamed(context, '/Settings');
            }),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: () {
              Navigator.pushNamed(context, '/Login');
            }),
//          new RaisedButton(onPressed: () {_peopleClicked('button pressed');}),
          ],

        ),
        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(
                    children: <Widget>[
                      new Text('home page'),
                      new Checkbox(value: _married, // the value which mathes with the text box
                          activeColor: Colors.blue, // color when it is clicked
                          onChanged: (bool stat){ismarried(stat);} // the onchanged function , this trggers the check box actin when clicked

                      ),
                    ]

                )
            )

        )

    );
  }

}

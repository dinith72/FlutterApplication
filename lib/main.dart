import 'package:flutter/material.dart';
import 'package:app/Screnns/login.dart';
import 'package:app/Screnns/Settings.dart';
import 'package:app/Screnns/switch.dart';
import 'package:app/Screnns/ListView.dart';
import 'package:app/Screnns/demo.dart';

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
        '/Home' : (BuildContext context) => new MyHomePage(),
        '/Switch' :(BuildContext context) => new Switcher(),
        '/ListViewer' :(BuildContext context) => new ListViewer(),
        '/Demo' :(BuildContext context) => new Demo()
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
  int _radioVal = 0;
  void ismarried(bool stat){
    setState(() {
      _married = stat;
    });
  }
  void radioValChanged(int val){
    setState(() {
      _radioVal = val;
      print(_radioVal);
    });
  }
  // this function create set of radio buttons
  List<Widget> makeRadios(){
    List<Widget> lst = new List<Widget>(); // creating a list of radio buttons
    for(int i =0;  i < 3;  i++){
      lst.add( new RadioListTile(
          value: i,
          groupValue: _radioVal, // the value of the radio button selected
          title: new Text('radio $i'), // title of the radio button
          onChanged: (int val){radioValChanged(val);}, // on changed action listener
          secondary: new Icon(Icons.print), // custom icon can be set

          )
      );

    }
    return lst;
  }
  @override
  Widget build(BuildContext context) {

    final ValueChanged<bool> onChanged = null;

    return new Scaffold(
        appBar: new AppBar(

          title: new Text("Home"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.print), onPressed: () {
              Navigator.pushNamed(context, '/Switch');
            }),
            new IconButton(icon: new Icon(Icons.adjust), onPressed: () {
              Navigator.pushNamed(context, '/Demo');
            }),
            new IconButton(icon: new Icon(Icons.people), onPressed: () {
              Navigator.pushNamed(context, '/ListViewer');
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
                      new Column(
                        children:makeRadios() , // radio buttons should be sent as list , crated in seperate function
                      )

                    ]
                )
            )

        )

    );
  }

}

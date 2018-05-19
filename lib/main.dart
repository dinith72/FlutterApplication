import 'package:flutter/material.dart';
import 'package:app/Screnns/login.dart';
import 'package:app/Screnns/Settings.dart';
import 'package:app/Screnns/switch.dart';
import 'package:app/Screnns/ListView.dart';
//import 'package:app/Screnns/demo.dart';
import 'package:app/Screnns/testdb.dart';

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
//        '/Demo' :(BuildContext context) => new Demo(),
//        '/Demo' : (BuildContext context) => new Demo(),
        '/TestDb' : (BuildContext context) => new Testdb(),
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

  class _MyHomePageState extends State<MyHomePage>  with WidgetsBindingObserver{   // extend with the widget bindng observer

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

  //this function create set of radio buttons
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
              Navigator.pushNamed(context, '/TestDb');
            }),
            new IconButton(icon: new Icon(Icons.people), onPressed: () {
              Navigator.pushNamed(context, '/ListViewer');
            }),
//          new RaisedButton(onPressed: () {_peopleClicked('button pressed');}),
          ],

        ),
          // scaffold has catagory named drawer , the following code should be created there
          drawer: new Drawer( // creating a drawer
            child: new Container(
                padding: new EdgeInsets.all(20.0),
               child: new Column(
                 children: <Widget>[
//                  adding some drawer tiles
                   new FlatButton.icon(
                       onPressed: (){ Navigator.pushNamed(context, '/Demo');},
                       icon: new Icon(Icons.list),
                       label: new Text('Demo')
                   ),
                   new FlatButton.icon(
                       onPressed: (){ Navigator.pushNamed(context, '/Settings');},
                       icon: new Icon(Icons.settings),
                       label: new Text('Settings')
                   ),
//
                 ],
               ),
            ),
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


  // the below 3 methods should be overridden
  @override
  void initState() {
    print('init state');
    super.initState();
    WidgetsBinding.instance.addObserver(this);

  }

  @override
  void dispose() {
    print('dispose');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {  // when app lifecycle state is changed
    print('state ' + state.toString());
    switch(state){
      case AppLifecycleState.inactive: // when another app is open , closing this app
        print('inactive'); //
        break;

      case AppLifecycleState.paused: // when another app is open , closing this app
        print('paused');
        break;

      case AppLifecycleState.resumed:
        print('suspended');
        break;

      case AppLifecycleState.suspending:
        print('suspending');
        break;




    }
  }

}

import 'package:flutter/material.dart';
import 'package:app/main.dart';


class Switcher extends  StatefulWidget {
  @override
  _Switcher createState() => new _Switcher(); // create private sub class

}

class _Switcher extends State<Switcher>{ // extened as state widget
  bool _switVal = false;
  double _sliVal = 0.0 ;
  List<String> names = new List<String>(); // list of the values for combo box
  String _cmbVal = '';
  @override
  void initState() { // initialising the drop down menu

    names.addAll(['dinith','chamaka','chathura','sidath']); //
    _cmbVal = names[0]; // assigning the first element of the list as the selected element
  }

  onChangedDropDown(String val){
    setState(() { // changing the state as soon as item is selected
      _cmbVal = val;
    });

  }

  onchagedSlider(double val){
    setState(() {
      _sliVal = val; // mnitor the value change of the slder
    });
  }
  switchOnClick(bool val){
    setState((){ // this method should be implemented
      _switVal= val;
    });
  }
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Switch'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new MyHomePage()),
                  ModalRoute.withName('/Home'));
            }),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: () {
              Navigator.pushNamed(context, '/Login');
            }),
//
          ],
        ),
        drawer: new Drawer(
            child: new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Column(
                children: <Widget>[
                  new FlatButton.icon(
                      onPressed: (){ Navigator.pushNamed(context, '/Switch');},
                      icon: new Icon(Icons.list),
                      label: new Text('switch')
                  ),
                  new FlatButton.icon(
                      onPressed: (){ Navigator.pushNamed(context, '/Settings');},
                      icon: new Icon(Icons.settings),
                      label: new Text('Settings')
                  ),
//
                ],
              ),
            )),
        body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
              child: new Column(
                  children: <Widget>[
                    new SwitchListTile(value: _switVal, // SwitchListTile add more functionality and
                        // also action is fired event the text associating with the switch is clicked
                        title: new Text('switch'),
                        onChanged: (bool val){switchOnClick(val);}// method to fire the switch action
                    ),
                    new Text('the slider values is ' +_sliVal.round().toString()),
                    new Slider(value: _sliVal, min: 0.0 , max: 100.0, onChanged: (val){onchagedSlider(val);}), // slider value we can set by max and min
                    new LinearProgressIndicator( value: _sliVal*0.01), // the value for the leaner progress bar should be between 0 to 1
                    new Text('the choosen value is $_cmbVal'),
                    new DropdownButton(
                        value: _cmbVal, // the currently selected value
                        items: names.map((String val){  // adding all the itmes to the list
                          return new DropdownMenuItem(child: new Text(val), value: val );
                        }).toList(),
                        onChanged: (String val){onChangedDropDown(val);}) // method to fire when selection is made
                  ]
              )
          ),
        ));
  } // all the componeents should be created here
}
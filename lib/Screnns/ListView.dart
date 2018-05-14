import 'package:flutter/material.dart';
import 'package:app/main.dart';

class ListViewer extends StatefulWidget{
  @override
  _ListViewer createState() => new _ListViewer();
}

class _ListViewer extends State<ListViewer>{
  List<bool> cities = new List<bool>(); // list of array of elements should be created , this can be class as well


  @override
  void initState() { // initaised state should be declared to load the compoennts
    setState(() {
      for ( int i = 0; i < 10 ; i++){
        cities.add(false);
      }
    });

  }

  void onChangeCheckBox(bool val, int index){ // to change the checked and unchecked property of check box
    setState(() {
      cities[index] = val;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('List view'),
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
        body: new ListView.builder( // directly call the list viewbuilder from body
            itemCount: cities.length ,
            itemBuilder: ( BuildContext context , int index ){
              return new Card(  // each item in the list is enclosed in new card
                child: new Container(
                  padding: new EdgeInsets.all(6.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('this is list $index'),
                      new Icon(Icons.list),
                      new CheckboxListTile( // check box list item
                          value: cities[index],
                          onChanged: (bool val){onChangeCheckBox(val,index);})
                      // only one varible inside the brackets because onchaged returns only one value => true / false
                    ],
                  ),
                ),
              );
            }
        )

    );
  }
}
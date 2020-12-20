import 'package:flutter/material.dart';
import 'package:unityapp/screens/home/form.dart';
import 'package:unityapp/screens/home/list.dart';
import 'package:unityapp/services/authenticate.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final Auth _auth = Auth();
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    FormParticipant(),
    ListParticipant(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Home'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              _auth.singOut();
            },
            icon: Icon(Icons.person),
            label: Text('Logout!'),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Register',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

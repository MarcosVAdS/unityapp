import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unityapp/screens/home/form.dart';
import 'package:unityapp/screens/home/list.dart';
import 'package:unityapp/services/authenticate.dart';
import 'package:unityapp/services/database.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key key}) : super(key: key);

  @override
  _MyStateBottomNav createState() => _MyStateBottomNav();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStateBottomNav extends State<BottomNav> {
  final Auth _auth = Auth();
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ListParticipant(),
    FormParticipant(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: Database().users,
      child: Scaffold(
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListParticipant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Person1'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Person2'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Person3'),
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:unityapp/services/authenticate.dart';

class Home extends StatelessWidget {
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("You're logged in!"),
            backgroundColor: Colors.purple,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  await _auth.singOut();
                },
                label: Text('Logout'),
                icon: Icon(Icons.person),
              )
            ],
          )),
    );
  }
}

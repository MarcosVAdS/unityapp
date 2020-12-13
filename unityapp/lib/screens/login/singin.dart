import 'package:flutter/material.dart';
import 'package:unityapp/services/authenticate.dart';

class SingIn extends StatefulWidget {
  final Function changeView;
  SingIn({this.changeView});

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final Auth _auth = Auth();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,
        title: Text('Sing up to Unity App'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.changeView();
            },
            icon: Icon(Icons.person),
            label: Text('Register'),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('assets/unitylogo.png')),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your name'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your password'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                  child: Text(
                    'SingIn!',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple,
                  onPressed: () async {
                    print(email);
                    print(password);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

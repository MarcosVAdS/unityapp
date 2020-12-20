import 'package:flutter/material.dart';
import 'package:unityapp/services/authenticate.dart';

class FormParticipant extends StatefulWidget {
  @override
  _FormParticipantState createState() => _FormParticipantState();
}

class _FormParticipantState extends State<FormParticipant> {
  final Auth _auth = Auth();
  String email = '';
  String password = '';
  String name = '';
  String login = '';
  String age = '';
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter name'),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter password'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter login'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    login = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Enter age'),
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                  child: Text(
                    'Register!',
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

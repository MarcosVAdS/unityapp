import 'package:flutter/material.dart';

class FormParticipant extends StatefulWidget {
  @override
  _FormParticipantState createState() => _FormParticipantState();
}

class _FormParticipantState extends State<FormParticipant> {
  String email = '';
  String password = '';
  String name = '';
  String login = '';
  String age = '';
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,
        title: Text('Create a new participant!'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.person),
            label: Text('Save!'),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your name'),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your email'),
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your login'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    login = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Enter your age'),
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

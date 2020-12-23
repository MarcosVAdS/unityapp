import 'package:flutter/material.dart';
import 'package:unityapp/services/authenticate.dart';

class Register extends StatefulWidget {
  final Function changeView;
  Register({this.changeView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  _RegisterState({this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,
        title: Text('Register in to Unity App'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.changeView();
            },
            icon: Icon(Icons.person),
            label: Text('Login!'),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('assets/unitylogo.png')),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your email'),
                validator: (value) => value.isEmpty ? 'Enter an email' : null,
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
                validator: (value) =>
                    value.length < 8 ? 'you need at least 8 characters' : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
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
                    if (_formKey.currentState.validate()) {
                      dynamic result =
                          await _auth.registerWithEmail(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Ops, fill in the fields correctly';
                        });
                      } else {}
                    }
                  }),
              SizedBox(height: 12.0),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
            ],
          ),
        ),
      ),
    );
  }
}

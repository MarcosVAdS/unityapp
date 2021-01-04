import 'package:flutter/material.dart';
import 'package:unityapp/services/authenticate.dart';
import 'package:unityapp/screens/loading.dart';

class SingIn extends StatefulWidget {
  final Function changeView;
  SingIn({this.changeView});

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    if(loading == true){
      print(loading);
      return Loading();
    }else{
      print(loading);
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('assets/unitylogo.png')),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? 'fill in the email field' : null,
                decoration: InputDecoration(labelText: 'Enter your email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) =>
                    value.length < 8 ? 'login or password incorrect' : null,
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
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.singInEmail(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'please, enter correct data';
                          loading = false;
                        });
                      }
                    }
                  }),
              SizedBox(height: 12.0),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
              RaisedButton(
                  child: Text(
                    'SingIn as Anonimous person!',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.grey,
                  onPressed: () async {
                    _auth.singInAnonimous();
                  }),
            ],
          ),
        ),
      ),
    );
    }
  }
}

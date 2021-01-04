import 'package:flutter/material.dart';
import 'package:unityapp/services/authenticate.dart';
import 'package:unityapp/services/database.dart';
import 'package:flutter/services.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';

class FormParticipant extends StatefulWidget {
  @override
  _FormParticipantState createState() => _FormParticipantState();
}

class _FormParticipantState extends State<FormParticipant> {
  final user = Auth().storage.getItem('user');
  final _formKey = new GlobalKey<FormState>();

  String name = '';
  String email = '';
  String login = '';
  String bio = '';
  int age;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50),
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
                decoration: InputDecoration(labelText: 'Enter login'),
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  setState(() {
                    age = int.parse(value);
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Describe you'),
                onChanged: (value) {
                  setState(() {
                    bio = value;
                  });
                },
              ),
              CheckboxListTileFormField(
                title: Text('Im interested on a dating!'),
                onSaved: (bool value) {
                  status = value;
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                  child: Text(
                    'Save!',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple,
                  onPressed: () async {
                    await Database(uid: user).createParticipant(
                        name, email, age, login, bio, status);
                        showResult(context);
                      }
                  )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showResult(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Saved!'),
        );
      },
    );
  }
}

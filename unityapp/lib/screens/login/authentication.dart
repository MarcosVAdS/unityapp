import 'package:flutter/material.dart';
import 'package:unityapp/screens/login/register.dart';
import 'package:unityapp/screens/login/singin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void changeView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    //here i will get the three buttons
    //sing in
    //sing in as anonymous
    //register

    if (showSignIn == true) {
      return SingIn(changeView: changeView);
    } else {
      return Register(changeView: changeView);
    }
  }
}

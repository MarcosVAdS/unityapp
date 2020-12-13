import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unityapp/models/user.dart';
import 'package:unityapp/screens/login/authentication.dart';
import 'package:unityapp/screens/home/home.dart';

//splash screen
//set the initial screen who will be loaded
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    //retunr Home or Auth widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

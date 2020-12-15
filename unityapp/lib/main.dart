import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unityapp/models/user.dart';
import 'package:unityapp/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:provider/provider.dart';
import 'package:unityapp/services/authenticate.dart';
import 'package:unityapp/screens/home/form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
        value: Auth().user,
        child: MaterialApp(
          home: FormParticipant(),
        ));
  }
}

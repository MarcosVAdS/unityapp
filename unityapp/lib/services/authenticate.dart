import 'package:firebase_auth/firebase_auth.dart';
import 'package:unityapp/models/user.dart';

class Auth {
  //_ beacause auth is private
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _user(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_user);
  }

  //register method

  //sing in method like a anonimous person
  Future singInAnonimous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _user(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //sing in method with email and password

  //sing out
  Future singOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

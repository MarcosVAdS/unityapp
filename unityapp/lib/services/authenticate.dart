import 'package:firebase_auth/firebase_auth.dart';
import 'package:unityapp/models/user.dart';
import 'package:localstorage/localstorage.dart';

class Auth {
  //_ beacause auth is private
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LocalStorage storage = new LocalStorage('user');

  UserModel _user(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_user);
  }

  //register method
  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _user(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

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
  Future singInEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      storage.setItem('user', user.uid);
      return _user(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //sing in whit google's account

  Future singInGoogle() {}

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

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;

  Database({this.uid});

  //collection reference
  final CollectionReference participantsColection =
      FirebaseFirestore.instance.collection('participants');

  Future createParticipant(String name, String email, int age, String login,
      String password, bool active) async {
    return await participantsColection.doc(uid).set({
      'name': name,
      'email': email,
      'age': age,
      'login': login,
      'password': password,
      'active': active
    });
  }
}

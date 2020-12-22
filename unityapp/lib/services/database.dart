import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class Database {
  String key = randomString(28);

  final String uid;
  Database({this.uid});

  final CollectionReference personColection =
      FirebaseFirestore.instance.collection('user');

  Future createParticipant(
      String name, String email, int age, String login, String bio) async {
    return await personColection.doc(key).set({
      'name': name,
      'email': email,
      'age': age,
      'login': login,
      'bio': bio,
    });
  }

  Stream<QuerySnapshot> get users {
    return personColection.snapshots();
  }
}

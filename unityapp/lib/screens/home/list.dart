import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListParticipant extends StatefulWidget {
  @override
  _ListParticipantState createState() => _ListParticipantState();
}

class _ListParticipantState extends State<ListParticipant> {
  @override
  Widget build(BuildContext context) {
    final usersList = Provider.of<QuerySnapshot>(context);

    //usersList.docs.forEach((value) => print(value.data()));
    if (usersList.docs.isEmpty) {
      return Text('Ops, we dont have any data to show!');
    } else {
      return ListView.builder(
          itemCount: usersList.docs.length,
          //scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            DocumentSnapshot user = usersList.docs[index];
            
            return Padding(
              padding: EdgeInsets.only(top: 8),
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: ListTile(
                  leading: Image(image: AssetImage('assets/user.jpg')),
                  title: Text(user.get('name')),
                  subtitle: Text(user.get('bio')),
                  onTap: () => {showContact(context, user.get('email'))},
                ),
              ),
            );
          });
          }
    }
  }

  Future<void> showContact(BuildContext context, String displayText) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('To enter in contact text to: '),
          content: Text(displayText),
        );
      },
    );
  }

            

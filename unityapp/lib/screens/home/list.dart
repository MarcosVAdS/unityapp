import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unityapp/services/database.dart';
import 'package:provider/provider.dart';

class ListParticipant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<QuerySnapshot>(context);

    print('teste');

    for (var doc in userList.docs) {
      print(doc.data);
    }
    return StreamProvider<QuerySnapshot>.value(
        value: Database().users,
        child: Container(
          height: 350,
          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
          child: Card(
            shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.purple, width: 2.0),
                borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              children: <Widget>[
                const ListTile(
                    leading: Image(image: AssetImage('assets/user.jpg')),
                    title: Text('Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0)),
                    subtitle: Text(
                      'User',
                      style: TextStyle(fontSize: 15.0),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tincidunt, est at fermentum fringilla, ligula tellus faucibus purus, vel luctus ligula nisi sed arcu. Nunc ut lacinia metus, ut vulputate nibh. Nunc vulputate justo ultricies condimentum pretium. Suspendisse dapibus dui nec purus molestie imperdiet. Nulla ac tristique sapien. Aenean felis ante, mattis vitae placerat quis, pulvinar sed neque. Proin quis libero suscipit, accumsan est sodales, cursus est. Aenean eu pellentesque tellus.',
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

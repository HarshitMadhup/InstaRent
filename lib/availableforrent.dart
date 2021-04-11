import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phone_verification/Items.dart';

class Available extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('rent')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> availableSnapshot) {
        if (availableSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final Docs = availableSnapshot.data.docs;
        return ListView.builder(
          reverse: false,
          itemCount: Docs.length,
          itemBuilder: (ctx, index) => MealItem(
            Docs[index].data()['name'].toString(),
            Docs[index].data()['availability'].toString(),
            Docs[index].data()['price'].toString(),
            Docs[index].data()['location'].toString(),
            Docs[index].data()['category'].toString(),
          ),
        );
      },
    );
  }
}

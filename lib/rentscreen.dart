import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:phone_verification/availableforrent.dart';

class RentScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Available(),
          ),
        ],
      ),
    );
  }
}

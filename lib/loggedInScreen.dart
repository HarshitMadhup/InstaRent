import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:phone_verification/lend.dart';
import 'package:phone_verification/loginScreen.dart';
import 'package:phone_verification/tabView.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var userName = '';

class LoggedInScreen extends StatefulWidget {
  LoggedInScreen({Key key}) : super(key: key);

  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabsScreen();
  }

  Future getUser() async {
    if (_auth.currentUser != null) {
      var cellNumber = _auth.currentUser.phoneNumber;
      cellNumber =
          '0' + _auth.currentUser.phoneNumber.substring(3, cellNumber.length);
      debugPrint(cellNumber);
      await _firestore
          .collection('users')
          .where('cellnumber', isEqualTo: cellNumber)
          .get()
          .then((result) {
        if (result.docs.length > 0) {
          setState(() {
            userName = result.docs[0].data()['name'];
          });
        }
      });
    }
  }

  signOut() {
    //redirect
    _auth.signOut().then((value) => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
  }
}

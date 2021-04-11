import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:phone_verification/loginScreen.dart';

class Requests extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, ind) => Container(
        padding: EdgeInsets.all(8),
        child: Card(
          color: Colors.blue[200],
          margin: EdgeInsets.all(8),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I want Laptop',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Description of the product ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text('Date Specifications'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

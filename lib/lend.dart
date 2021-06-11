import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LendScreen extends StatefulWidget {
  @override
  _LendScreenState createState() => _LendScreenState();
}

class _LendScreenState extends State<LendScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final form1 = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController categoryController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController contactController = new TextEditingController();
  final TextEditingController availabilityController =
      new TextEditingController();
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController dateController = new TextEditingController();
  final _controller = new TextEditingController();

  //Form controllers
  @override
  void initState() {
    super.initState();
  }

  void _sendMessage(String title, String price, String availability,
      String contact, String category, String location) async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    // final user = FirebaseAuth.instance.currentUser;
    // final userData = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.uid)
    //     .get();
    FirebaseFirestore.instance.collection('rent').add({
      'createdAt': Timestamp.now(),
      // 'userId': user.uid,
      // 'username': userData.data()['name'],
      'name': title,
      'price': price,
      'availability': availability,
      'contact': userData.data()['cellnumber'],
      'category': category,
      'location': location
      // 'userImage':  _image,
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return lendScreen();
  }

  Widget lendScreen() {
    final node = FocusScope.of(context);
    return ListView(children: [
      new Column(children: [
        Form(
          key: form1,
          child: Column(children: [
            Container(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Title'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a name';
                  }
                },
              ),
            )),
            Container(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextFormField(
                controller: categoryController,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Category'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a category';
                  }
                },
              ),
            )),
            Container(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextFormField(
                controller: locationController,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Location'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a location';
                  }
                },
              ),
            )),
            Container(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextFormField(
                controller: contactController,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'ALternate Contact'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an alternate contact';
                  }
                },
              ),
            )),
            Container(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextFormField(
                controller: availabilityController,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Availability'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please check availablity';
                  }
                },
              ),
            )),
            Container(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: TextFormField(
                controller: priceController,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Price'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price';
                  }
                },
              ),
            )),
            // Container(
            //     child: Padding(
            //   padding: const EdgeInsets.symmetric(
            //       vertical: 10.0, horizontal: 10.0),
            //   child: TextFormField(
            //     controller: dateController,
            //     textInputAction: TextInputAction.next,
            //     onEditingComplete: () => node.nextFocus(),
            //     decoration: InputDecoration(
            //         floatingLabelBehavior: FloatingLabelBehavior.never,
            //         labelText: 'Date'),
            //     validator: (value) {
            //       if (value.isEmpty) {
            //         return 'Please enter a date';
            //       }
            //     },
            //   ),
            // )),
            ElevatedButton(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _sendMessage(
                  nameController.text.trim(),
                  priceController.text.trim(),
                  availabilityController.text.trim(),
                  contactController.text.trim(),
                  categoryController.text.trim(),
                  locationController.text.trim(),
                );
              },
            )
          ]),
        )
      ])
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:phone_verification/rentscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'MainDrawer.dart';
import 'Requests.dart';
import 'lend.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Widget> _pages = [RentScreen(), LendScreen(), Requests()];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      print(_selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageIndex == 0 ? "Rent" : "Lend"),
        actions: [
          DropdownButton(
            underline: Container(),
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      // drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Rent'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Lend'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Requests'),
          ),
        ],
      ),
    );
  }
}

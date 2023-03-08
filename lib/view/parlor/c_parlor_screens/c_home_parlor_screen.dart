import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'c_login_parlor_screen.dart';

class CHomeParlorScreen extends StatelessWidget {
  const CHomeParlorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CLoginParlorScreen())));
            },
          )
        ],
      ),
      body: Center(child: Text('This is customer parlor home screen')),
    );
  }
}
import 'package:barber_parlor_app_fyp/view/parlor/sp_parlor_screens/sp_login_parlor_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SpHomeParlorScreen extends StatelessWidget {
  const SpHomeParlorScreen({super.key});

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
              auth.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SpLoginParlorScreen())));
            },
          )
        ],
      ),
      body: Center(child: Text('This is service provider parlor home screen')),
    );
  }
}

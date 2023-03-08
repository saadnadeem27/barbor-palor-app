import 'package:barber_parlor_app_fyp/view/parlor/c_parlor_screens/c_home_parlor_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../../../view_model/services/session_manager.dart';



class CLoginControllerParlor with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  void setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) async {
    setloading(true);
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
            SessionManager().userId = value.user!.uid.toString();
        setloading(false);
        Utils.toastMessage('User Login Successfully');
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>CHomeParlorScreen()));
      });
    } on FirebaseAuthException catch (e) {
      setloading(false);
      Utils.toastMessage(e.toString());
    }
  }
}

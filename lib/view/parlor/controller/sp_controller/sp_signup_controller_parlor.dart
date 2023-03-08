import 'package:barber_parlor_app_fyp/view/parlor/sp_parlor_screens/sp_home_parlor_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../../../view_model/services/session_manager.dart';


// import '../../../utils/routes/route_name.dart';
// import '../../../utils/utils.dart';
// import '../../services/session_manager.dart';

class SpSignupControllerParlot with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('parlor service providers');
  bool _loading = false;
  
  bool get loading => _loading;

  void setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signup(BuildContext context, String username, String email,
      String password) async {
        
        final completeEmail = '$email.P_SP@gmail.com';
    setloading(true);
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: completeEmail,
        password: password,
      )
          .then((value) {
            SessionManager().userId = value.user!.uid.toString();

        firestore.doc(value.user!.uid).set({
          'uid': value.user!.uid,
          'userName': username,
          'email':completeEmail ,
          'phone': '',
          'onlineStatus': 'NoOne',
          'profile': '',
        }).then((value) {
  
          setloading(false);
          if(completeEmail.contains('.P_SP@gmail.com')){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SpHomeParlorScreen(),),);
          }
          else{
            Utils.toastMessage('Invalid email');
          }
        });

        setloading(false);
        Utils.toastMessage('User Created Successfully');
      });
    } on FirebaseAuthException catch (e) {
      setloading(false);
      Utils.toastMessage(e.toString());
    }
  }
}

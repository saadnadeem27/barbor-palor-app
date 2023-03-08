import 'package:barber_parlor_app_fyp/res/components/round_button.dart';
import 'package:barber_parlor_app_fyp/view/parlor/c_parlor_screens/c_login_parlor_screen.dart';
import 'package:barber_parlor_app_fyp/view/parlor/c_parlor_screens/c_signup_parlor_screen.dart';
import 'package:barber_parlor_app_fyp/view/parlor/sp_parlor_screens/sp_login_parlor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SelectParlorPersonTypeScreen extends StatelessWidget {
  const SelectParlorPersonTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Are you ?',style: Theme.of(context).textTheme.headline2),
          RoundButton(title: 'Customer', onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CLoginParlorScreen()));
          }),
          RoundButton(title: 'Parlor Service Provider', onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SpLoginParlorScreen()));

          })

        ],
      ),
    );
  }
}
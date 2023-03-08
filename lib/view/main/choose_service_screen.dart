import 'package:barber_parlor_app_fyp/res/components/round_button.dart';
import 'package:barber_parlor_app_fyp/utils/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChooseServiceScreen extends StatelessWidget {
  const ChooseServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Choose Service',style: Theme.of(context).textTheme.headline3,),
          RoundButton(title: 'Barbar', onTap: (){

          }),
          RoundButton(title: 'Parlor', onTap: (){
            Navigator.pushNamed(context, RouteName.selectParlorPersonTypeScreen);
          }),
        ],
      ),
    );
  }
}
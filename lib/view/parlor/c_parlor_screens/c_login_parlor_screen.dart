import 'package:barber_parlor_app_fyp/view/parlor/controller/c_controller/c_login_controller_parlor.dart';
import 'package:barber_parlor_app_fyp/view/parlor/c_parlor_screens/c_signup_parlor_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import '../../../res/components/input_text_field.dart';
import '../../../res/components/round_button.dart';
import '../../../utils/routes/route_name.dart';


class CLoginParlorScreen extends StatefulWidget {
  const CLoginParlorScreen({super.key});

  @override
  State<CLoginParlorScreen> createState() => _CLoginParlorScreenState();
}

class _CLoginParlorScreenState extends State<CLoginParlorScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  bool checkPass = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * .01,
                    ),
                    Text(
                      'Parlor Customer\n Login Form',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3!.copyWith(height: 0),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    // Text(
                    //   'Parlor Customer Login',
                    //   textAlign: TextAlign.center,
                    //   style: Theme.of(context).textTheme.headline6!.copyWith(height: 0),
                    // ),
                    SizedBox(height: 20,),
                    ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(20)),
                          child: Image.network(
                              'https://img.freepik.com/premium-vector/make-up-cosmetics-collection-glamour-girl-flat-illustration_2175-4167.jpg?size=626&ext=jpg'),
                        ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height * .06, bottom: height * .01),
                          child: Column(
                            children: [
                              InputTextField(
                                  myController: emailController,
                                  focusNode: emailFocusNode,
                                  onFiledSubmittedValue: (value) {},
                                  onValidator: (value) {
                                    return value.isEmpty ? 'Enter email' : null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  hint: 'Email',
                                  obscureText: false,
                                  prefixIcon: Icons.email_outlined,),
                              SizedBox(
                                height: height * .01,
                              ),
                              InputTextField(
                                  myController: passwordController,
                                  suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            checkPass = !checkPass;
                                          });
                                        },
                                        child: checkPass
                                            ? Icon(Icons.visibility_outlined)
                                            : Icon(
                                                Icons.visibility_off_outlined),
                                      ),
                                  focusNode: passwordFocusNode,
                                  onFiledSubmittedValue: (value) {},
                                  onValidator: (value) {
                                    return value.isEmpty
                                        ? 'Enter password'
                                        : null;
                                  },
                                  keyboardType: TextInputType.text,
                                  hint: 'Password',
                                  obscureText: checkPass ? false : true, prefixIcon: Icons.lock_outline,),
                            ],
                          ),
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, RouteName.forgotPasswordScreen);
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontSize: 15, decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    ChangeNotifierProvider(
                      create: (_) => CLoginControllerParlor(),
                      child: Consumer<CLoginControllerParlor>(
                        builder: (context, provider, child) {
                          return RoundButton(
                            loading: provider.loading,
                            title: 'Login',
                            
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                provider.login(
                                  context,
                                  emailController.text.toString(),
                                  passwordController.text.toString(),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, RouteName.signupScreen);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CSignupParlorScreen()));
                      },
                      child: Text.rich(
                        TextSpan(
                            text: 'Don\'t have an account ?',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontSize: 15),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                        fontSize: 15,
                                        decoration: TextDecoration.underline),
                              ),
                            ]),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

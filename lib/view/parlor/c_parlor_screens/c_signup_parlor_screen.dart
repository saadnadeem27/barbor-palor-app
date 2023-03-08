import 'package:barber_parlor_app_fyp/view/parlor/c_parlor_screens/c_login_parlor_screen.dart';
import 'package:barber_parlor_app_fyp/view/parlor/sp_parlor_screens/sp_login_parlor_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../res/components/input_text_field.dart';
import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../controller/c_controller/c_signup_controller_parlor.dart';

class CSignupParlorScreen extends StatefulWidget {
  const CSignupParlorScreen({super.key});

  @override
  State<CSignupParlorScreen> createState() => _CSignupParlorScreenState();
}

class _CSignupParlorScreenState extends State<CSignupParlorScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    usernameFocusNode.dispose();
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
            child: ChangeNotifierProvider(
              create: (_) => CSignupControllerParlor(),
              child: Consumer<CSignupControllerParlor>(
                  builder: (context, provider, child) {
                return SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * .01,
                        ),
                        Text(
                          'Parlor Customer\n Signup Form',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(height: 0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(20)),
                          child: Image.network(
                              'https://img.freepik.com/free-vector/makeup-beautician-hairdresser-salon-illustration_1284-59326.jpg?size=626&ext=jpg'),
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        // Text(
                        //   'Parlor Customer Signup',
                        //   textAlign: TextAlign.center,
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .headline6!
                        //       .copyWith(height: 0),
                        // ),
                        // SizedBox(
                        //   height: height * .03,
                        // ),
                        // Text(
                        //   'Enter your email address \nto register to your account',
                        //   style: Theme.of(context).textTheme.subtitle1,
                        //   textAlign: TextAlign.center,
                        // ),
                        // SizedBox(
                        //   height: height * .01,
                        // ),
                        Form(
                            key: _formKey,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: height * .06, bottom: height * .01),
                              child: Column(
                                children: [
                                  InputTextField(
                                      prefixIcon: Icons.person_outline,
                                      myController: usernameController,
                                      focusNode: usernameFocusNode,
                                      onFiledSubmittedValue: (value) {
                                        Utils.fieldFocus(context,
                                            usernameFocusNode, emailFocusNode);
                                      },
                                      onValidator: (value) {
                                        return value.isEmpty
                                            ? 'Enter username'
                                            : null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      hint: 'Username',
                                      obscureText: false),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  InputTextField(
                                      prefixIcon: Icons.email_outlined,
                                      myController: emailController,
                                      focusNode: emailFocusNode,
                                      onFiledSubmittedValue: (value) {},
                                      onValidator: (value) {
                                        return value.isEmpty
                                            ? 'Enter email'
                                            : null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      hint: 'Email',
                                      obscureText: false),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  InputTextField(
                                      prefixIcon: Icons.lock_outline,
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
                                      myController: passwordController,
                                      focusNode: passwordFocusNode,
                                      onFiledSubmittedValue: (value) {},
                                      onValidator: (value) {
                                        return value.isEmpty
                                            ? 'Enter password'
                                            : null;
                                      },
                                      keyboardType: TextInputType.text,
                                      hint: 'Password',
                                      obscureText: checkPass ? false : true),
                                ],
                              ),
                            )),
                        RoundButton(
                          title: 'Sign Up',
                          loading: provider.loading,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              provider.signup(
                                  context,
                                  usernameController.text.toString(),
                                  emailController.text.toString(),
                                  passwordController.text.toString());
                            }
                          },
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        InkWell(
                          onTap: () {
                            //Navigator.pushNamed(context, RouteName.loginScreen);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CLoginParlorScreen()));
                          },
                          child: Text.rich(
                            TextSpan(
                                text: 'Already have an account ?',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: 15),
                                children: [
                                  TextSpan(
                                    text: 'Login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            fontSize: 15,
                                            decoration:
                                                TextDecoration.underline),
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                );
              }),
            )),
      ),
    );
  }
}

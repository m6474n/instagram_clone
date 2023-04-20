import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/components/custom_button.dart';
import 'package:instagram_clone/components/inputField.dart';
import 'package:instagram_clone/responsive/mobileScreenLayout.dart';
import 'package:instagram_clone/responsive/responsive.dart';
import 'package:instagram_clone/responsive/webScreenLayout.dart';
import 'package:instagram_clone/screens/tabs/home_screen.dart';
import 'package:instagram_clone/screens/sign%20up/register_email.dart';
import 'package:instagram_clone/screens/sign%20up/register_phone.dart';

import '../../components/blue_button.dart';
import '../../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final emailFocusedNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusedNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
 bool loading = false;
  void isLogin() {
setState(() {
  loading = true;
});
    auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){
          setState(() {
            loading= false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successfully')));
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ResponsiveLayout(webScreenLayout: WebScreen(), mobileScreenLayout: MobileScreen(),)));

    }).onError((error, stackTrace){
      setState(() {
        loading= false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Image(
                image: AssetImage(
                  'assets/logo.png',
                ),
                height: 80,
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputField(
                        title: 'Email',
                        controller: emailController,
                        focusNode: emailFocusedNode,
                        validator: (value) {
                          return value.isEmpty ? 'Enter Email' : null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InputField(
                        title: 'Password',
                        controller: passwordController,
                        focusNode: passwordFocusedNode,
                        validator: (value) {
                          return value.isEmpty ? 'Enter Password' : null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscure: true,
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CustomButton(
                        title: 'Login',
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            isLogin();
                          }
                        }, loading: loading,
                      ),
                      TextButton(
                          onPressed: () {}, child: Text('Forget Password?')),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      BlueButton(
                        title: 'Create account',
                        onPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> EmailRegisterScreen()));
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
//
        );
  }
}

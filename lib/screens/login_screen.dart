import 'package:flutter/material.dart';
import 'package:instagram_clone/components/custom_button.dart';
import 'package:instagram_clone/components/inputField.dart';
import 'package:instagram_clone/screens/register_phone.dart';

import '../components/blue_button.dart';
import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          SizedBox(height: height*0.05,),
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
              child: Column(
                children: [
                  InputField(title: 'Username'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  InputField(title: 'Password')
                  , SizedBox(
                    height: height * 0.04,
                  ),CustomButton(title: 'Login', onPress: () {  },),
                  TextButton(onPressed: (){}, child: Text('Forget Password?')),
                  SizedBox(height: height*0.1,)
                  ,BlueButton(title: 'Create account', onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneRegisterScreen()));
                  },)
                ],
              ),
            ),
          )
        ],
      ),
    )

        );
  }
}

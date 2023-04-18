import 'package:flutter/material.dart';
import 'package:instagram_clone/components/blue_button.dart';
import 'package:instagram_clone/components/inputField.dart';
import 'package:instagram_clone/components/transparent_button.dart';
import 'package:instagram_clone/screens/sign%20up/pass_screen.dart';

import 'package:instagram_clone/screens/sign%20up/register_phone.dart';




class EmailRegisterScreen extends StatefulWidget {
  const EmailRegisterScreen({Key? key}) : super(key: key);

  @override
  State<EmailRegisterScreen> createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailNode = FocusNode();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "What's your email?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 30),
                      child: Text(
                        'Enter the email where you can be connected. No one will see this on your profile.',
                        style: TextStyle(
                            color: Colors.grey.shade100, fontSize: 17),
                      ),
                    ),

Form(
    key :_formKey ,
  child: Column(children: [
  InputField(title: 'Email',  controller: emailController,
    focusNode: emailNode,
    validator: (value) {
      return value.isEmpty?"Enter Email": null;
    },
    keyboardType: TextInputType.emailAddress,
  ),

  SizedBox(height: 20,),
  BlueButton(title: 'Next', onPress: () {
    if(_formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PasswordScreen(email: emailController.text.toString(),)));

    }
  },),
],)),
  
                    SizedBox(
                      height: 20,
                    ),
                    TransparentButton(
                      title: 'Sign up with mobile number',
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneRegisterScreen()));
                      },
                    )

                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

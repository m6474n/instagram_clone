import 'package:flutter/material.dart';
import 'package:instagram_clone/components/blue_button.dart';
import 'package:instagram_clone/components/inputField.dart';
import 'package:instagram_clone/components/transparent_button.dart';
import 'package:instagram_clone/screens/sign%20up/register_email.dart';
import 'package:instagram_clone/screens/sign%20up/verification_screen.dart';

class PhoneRegisterScreen extends StatefulWidget {
  const PhoneRegisterScreen({Key? key}) : super(key: key);

  @override
  State<PhoneRegisterScreen> createState() => _PhoneRegisterScreenState();
}

class _PhoneRegisterScreenState extends State<PhoneRegisterScreen> {
  final mobileController = TextEditingController();
  final mobileFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "What's yout mobile number?",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 30),
                      child: Text(
                        'Enter the mobile number where you can be connected. No one will see this on your profile.',
                        style: TextStyle(color: Colors.grey.shade100, fontSize: 17),
                      ),
                    ),
                    InputField(title: 'Mobile number',  controller: mobileController,
                      focusNode: mobileFocusNode,
                      validator: (value) {
                      return value.isEmpty? 'Enter Mobile Number':null;
                      },
                      keyboardType: TextInputType.phone,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'You may receive SMS notifications from us for security and login purposes.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20,),
                    BlueButton(title: 'Next', onPress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationScreen()));
                    },),
SizedBox(height: 20,),
TransparentButton(title: 'Sign up with email', onPress: () {

  Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailRegisterScreen()));
},)
                  ],
                ),
              ),
              TextButton(onPressed: (){}, child: Text('Already have an account?', style: TextStyle(fontSize: 16),))
            ],
          ),
        ),
      ),
    );
  }
}
